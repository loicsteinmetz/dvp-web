require 'rails_helper'

RSpec.describe Admin::FoliosController, type: :controller do

  include Devise::Test::ControllerHelpers
  let(:admin) { FactoryBot.create(:admin) }
  let(:folio) do
    folio = Folio.new(title: "website", website: "https://website.com", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
    folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
    folio.save
    return folio
  end
  let(:folio2) do
    folio = Folio.new(title: "website", website: "https://website.com", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
    folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
    folio.save
    return folio
  end

  describe "create" do
    it "redirects to login page if no admin auth" do
      post :create, params: { }, format: :js, xhr: true
      expect(response.status).to eq(401)
    end
    it 'displays an error with an invalid instance' do
      sign_in admin
      post :create, params: { }, format: :js, xhr: true
      expect(flash[:alert]).not_to be_nil
    end
    it "creates an instance" do
      sign_in admin
      f = folio
      expect(Folio.count).to eq(1)
    end
  end

  describe "new" do
    it "redirects to login page if no admin auth" do
      get :new, format: :js, xhr: true
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
      f = folio
      get :edit, params: { id: f.id, format: 'js' }, xhr: true
      expect(response.status).to eq(401)
    end
    it "assigns @entry" do
      f = folio
      sign_in admin
      get :edit, params: { id: f.id, format: 'js' }, xhr: true
      expect(assigns(:folio)).to eq(f)
    end
    it 'returns 200' do
      f = folio
      sign_in admin
      get :edit, params: { id: f.id, format: 'js' }, xhr: true
      expect(response.status).to eq(200)
    end
  end

  describe 'update' do
    it "redirects to login page if no admin auth" do
      f = folio
      put :update, params: { id: f.id, title: 'test', format: 'js' }, xhr: true
      expect(response.status).to eq(401)
    end
    it "assigns @entry" do
      f = folio
      sign_in admin
      put :update, params: { id: f.id, title: 'test', format: 'js' }, xhr: true
      expect(assigns(:folio)).to eq(f)
    end
    it 'returns 200' do
      f = folio
      sign_in admin
      put :update, params: { id: f.id, title: 'test', format: 'js' }, xhr: true
      expect(response.status).to eq(200)
    end
    it 'displays an error with an invalid instance' do
      f = folio
      sign_in admin
      put :update, params: { id: f.id, title: '', format: 'js' }, xhr: true
      expect(flash[:alert]).not_to be_nil
    end
  end

  describe 'destroy' do
    it "redirects to login page if no admin auth" do
      f = folio
      delete :destroy, params: { id: f.id }, format: :js, xhr: true
      expect(response.status).to eq(401)
    end
    it "destroys the instance" do
      f = folio
      sign_in admin
      delete :destroy, params: { id: f.id }, format: :js, xhr: true
      expect(CvEntry.count).to eq(0)
    end
  end

  describe 'reorder up and down' do
    it "redirects to login page if no admin auth" do
      f = folio
      f2 = folio2
      post :order_up, params: { id: f.id, format: 'js' }
      expect(response.status).to eq(401)
    end
    it 'reorders up' do
      f = folio
      f2 = folio2
      sign_in admin
      post :order_up, params: { id: f2.id, format: 'js' }
      expect(Folio.last.order).to eq(0)
      expect(Folio.first.order).to eq(1)
    end
    it 'does not reorder up for a first position instance' do
      f = folio
      f2 = folio2
      sign_in admin
      post :order_up, params: { id: f.id, format: 'js' }
      expect(Folio.last.order).to eq(1)
      expect(Folio.first.order).to eq(0)
    end
    it 'reorders down' do
      f = folio
      f2 = folio2
      sign_in admin
      post :order_down, params: { id: f.id, format: 'js' }
      expect(Folio.last.order).to eq(0)
      expect(Folio.first.order).to eq(1)
    end
    it 'does not reorder down for a last position instance' do
      f = folio
      f2 = folio2
      sign_in admin
      post :order_down, params: { id: f2.id, format: 'js' }
      expect(Folio.last.order).to eq(1)
      expect(Folio.first.order).to eq(0)
    end
  end

end