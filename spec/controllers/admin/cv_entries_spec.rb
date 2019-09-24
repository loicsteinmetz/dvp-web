require 'rails_helper'

RSpec.describe Admin::CvEntriesController, type: :controller do

  include Devise::Test::ControllerHelpers
  let(:admin) { FactoryBot.create(:admin) }
  let(:time) { TimeCv.create(date: 'test') }

  describe "create" do
    it "redirects to login page if no admin auth" do
      post :create, params: { title: 'test', date: time }, format: :js
      expect(response.status).to eq(401)
    end
    it 'displays an error with an invalid instance' do
      sign_in admin
      post :create, params: { date: time }, format: :js
      expect(flash[:alert]).not_to be_nil
    end
    it "creates an instance" do
      sign_in admin
      expect { 
        post :create, params: { title: 'test', date: time }, format: :js
      }.to change(CvEntry,:count).by(1)
    end
  end

  describe "new" do
    it "redirects to login page if no admin auth" do
      get :new, format: :js
      expect(response.status).to eq(401)
    end
    it "return code 200" do
      sign_in admin
      get :new, format: :js, xhr: true
      expect(response.status).to eq(200)
    end
  end

  describe 'edit' do
    it "redirects to login page if no admin auth" do
      t = CvEntry.create(title: 'test', date: time)
      get :edit, params: { id: t.id, format: 'js' }
      expect(response.status).to eq(401)
    end
    it "assigns @entry" do
      t = CvEntry.create(title: 'test', date: time)
      sign_in admin
      get :edit, params: { id: t.id, format: 'js' }, xhr: true
      expect(assigns(:entry)).to eq(t)
    end
    it 'returns 200' do
      t = CvEntry.create(title: 'test', date: time)
      sign_in admin
      get :edit, params: { id: t.id, format: 'js' }, xhr: true
      expect(response.status).to eq(200)
    end
  end

  describe 'update' do
    it "redirects to login page if no admin auth" do
      t = CvEntry.create(title: 'test', date: time)
      put :update, params: { id: t.id, title: 'hello', sub: 'test', format: 'js' }
      expect(response.status).to eq(401)
    end
    it "assigns @entry" do
      t = CvEntry.create(title: 'test', date: time)
      sign_in admin
      put :update, params: { id: t.id, title: 'hello', sub: 'test', format: 'js' }
      expect(assigns(:entry)).to eq(t)
    end
    it 'returns 200' do
      t = CvEntry.create(title: 'test', date: time)
      sign_in admin
      put :update, params: { id: t.id, date: 'hello', sub: 'test', format: 'js' }
      expect(response.status).to eq(200)
    end
    it 'displays an error with an invalid instance' do
      t = CvEntry.create(title: 'test', date: time)
      sign_in admin
      put :update, params: { id: t.id, title: '', format: 'js' }
      expect(flash[:alert]).not_to be_nil
    end
  end

  describe 'destroy' do
    it "redirects to login page if no admin auth" do
      t = CvEntry.create(title: 'test', date: time)
      delete :destroy, params: { id: t.id }, format: :js
      expect(response.status).to eq(401)
    end
    it "destroys the instance" do
      t = CvEntry.create(title: 'test', date: time)
      sign_in admin
      delete :destroy, params: { id: t.id }, format: :js
      expect(CvEntry.count).to eq(0)
    end
  end

end