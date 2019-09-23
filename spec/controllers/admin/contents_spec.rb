require 'rails_helper'

RSpec.describe Admin::ContentsController, type: :controller do

  include Devise::Test::ControllerHelpers
  let(:admin) { FactoryBot.create(:admin) }

  describe "GET edit" do
    it "forbids the access whithout an admin auth" do
      content = Content.create(name: "competences-1", title: "front end", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec.")
      get :edit, params: { id: content.id, format: 'js' }, xhr: true
      expect(response.status).to eq(401)
    end
    context 'logged' do
      it "assigns @content" do
        content = Content.create(name: "competences-1", title: "front end", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec.")
        sign_in admin
        get :edit, params: { id: content.id, format: 'js' }, xhr: true
        expect(assigns(:content)).to eq(content)
      end
      it "renders the edit template" do
        content = Content.create(name: "competences-1", title: "front end", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec.")
        sign_in admin
        get :edit, params: { id: content.id, format: 'js' }, xhr: true
        expect(response).to render_template("edit")
      end
    end
  end

end