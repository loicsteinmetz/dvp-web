require 'rails_helper'

RSpec.describe StaticController, type: :controller do

  describe "GET home" do
    it "assigns @contents" do
      content = Content.create(name: "hero-1", title: "un site responsive", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
      get :home
      expect(assigns(:contents)).to eq([content])
    end
    it "renders the home template" do
      get :home
      expect(response).to render_template("home")
    end
  end
  # describe "GET portfolio" do
  #   it "renders the portfolio template" do
  #     get :portfolio
  #     expect(response).to render_template("portfolio")
  #   end
  # end
  describe "GET mentions_legales" do
    it "renders the mentions_legales template" do
      get :mentions_legales
      expect(response).to render_template("mentions_legales")
    end
  end

end