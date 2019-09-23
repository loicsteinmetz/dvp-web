require 'rails_helper'

RSpec.describe Admin::AdminController, type: :controller do

  include Devise::Test::ControllerHelpers
  let(:admin) { FactoryBot.create(:admin) }

  describe "GET dashboard" do
    it "redirects to login page if no admin auth" do
      get :dashboard
      response.should redirect_to(new_admin_admin_session_path)
    end
    context 'logged' do
      it "assigns @contents" do
        content = Content.create(name: "hero-1", title: "un site responsive", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        sign_in admin
        get :dashboard
        expect(assigns(:contents)).to eq([content])
      end
      it "assigns @times" do
        TimeCv.destroy_all
        time = TimeCv.create(date: "depuis 2019", order: 0)
        sign_in admin
        get :dashboard
        expect(assigns(:times)).to eq([time])
      end
      it "assigns @folios" do
        folio = Folio.new(title: "website0", website: "https://website0.com", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 0)
        folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        folio.save
        sign_in admin
        get :dashboard
        expect(assigns(:folios)).to eq([folio])
      end
      it "renders the dashboard template" do
        sign_in admin
        get :dashboard
        expect(response).to render_template("dashboard")
      end
    end
  end

end