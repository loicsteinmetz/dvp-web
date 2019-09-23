require 'rails_helper'

RSpec.describe Admin::TimeCvsController, type: :controller do

  include Devise::Test::ControllerHelpers
  let(:admin) { FactoryBot.create(:admin) }

  describe "create" do
    it "redirects to login page if no admin auth" do
      post :create, params: { }, format: :js
      expect(response.status).to eq(401)
    end
    it 'displays an error with an invalid instance' do
      sign_in admin
      post :create, params: { }, format: :js
      expect(flash[:alert]).not_to be_nil
    end
    it "creates an instance" do
      sign_in admin
      expect { 
        post :create, params: { date: 'test'}, format: :js
      }.to change(TimeCv,:count).by(1)
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
      t = TimeCv.create(date: 'test')
      get :edit, params: { id: t.id, format: 'js' }
      expect(response.status).to eq(401)
    end
    it "assigns @time" do
      t = TimeCv.create(date: 'test')
      sign_in admin
      get :edit, params: { id: t.id, format: 'js' }, xhr: true
      expect(assigns(:time)).to eq(t)
    end
    it 'returns 200' do
      t = TimeCv.create(date: 'test')
      sign_in admin
      get :edit, params: { id: t.id, format: 'js' }, xhr: true
      expect(response.status).to eq(200)
    end
  end

  describe 'update' do
    it "redirects to login page if no admin auth" do
      t = TimeCv.create(date: 'test')
      put :update, params: { id: t.id, date: 'hello', format: 'js' }
      expect(response.status).to eq(401)
    end
    it "assigns @time" do
      t = TimeCv.create(date: 'test')
      sign_in admin
      put :update, params: { id: t.id, date: 'hello', format: 'js' }
      expect(assigns(:time)).to eq(t)
    end
    it 'returns 200' do
      t = TimeCv.create(date: 'test')
      sign_in admin
      put :update, params: { id: t.id, date: 'hello', format: 'js' }
      expect(response.status).to eq(200)
    end
    it 'displays an error with an invalid instance' do
      t = TimeCv.create(date: 'test')
      sign_in admin
      put :update, params: { id: t.id, date: '', format: 'js' }
      expect(flash[:alert]).not_to be_nil
    end
  end

  describe 'destroy' do
    t = TimeCv.create(date: 'test')
    it "redirects to login page if no admin auth" do
      delete :destroy, params: { id: t.id }, format: :js
      expect(response.status).to eq(401)
    end
    it "destroys the instance" do
      t = TimeCv.create(date: 'test')
      sign_in admin
      delete :destroy, params: { id: t.id }, format: :js
      expect(TimeCv.count).to eq(0)
    end
  end

  describe 'reorder up and down' do
    it "redirects to login page if no admin auth" do
      t = TimeCv.create(date: 'test')
      post :order_up, params: { id: t.id, format: 'js' }
      expect(response.status).to eq(401)
    end
    it 'reorders up' do
      t = TimeCv.create(date: 'test')
      t2 = TimeCv.create(date: 'test2')
      sign_in admin
      post :order_up, params: { id: t2.id, format: 'js' }
      expect(TimeCv.last.order).to eq(0)
      expect(TimeCv.first.order).to eq(1)
    end
    it 'does not reorder up for a first position instance' do
      t = TimeCv.create(date: 'test')
      t2 = TimeCv.create(date: 'test2')
      sign_in admin
      post :order_up, params: { id: t.id, format: 'js' }
      expect(TimeCv.last.order).to eq(1)
      expect(TimeCv.first.order).to eq(0)
    end
    it 'reorders down' do
      t = TimeCv.create(date: 'test')
      t2 = TimeCv.create(date: 'test2')
      sign_in admin
      post :order_down, params: { id: t.id, format: 'js' }
      expect(TimeCv.last.order).to eq(0)
      expect(TimeCv.first.order).to eq(1)
    end
    it 'does not reorder down for a first position instance' do
      t = TimeCv.create(date: 'test')
      t2 = TimeCv.create(date: 'test2')
      sign_in admin
      post :order_down, params: { id: t2.id, format: 'js' }
      expect(TimeCv.last.order).to eq(1)
      expect(TimeCv.first.order).to eq(0)
    end
  end

end