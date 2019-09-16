require 'rails_helper'

RSpec.describe Content, type: :model do

  before(:each) do 
    @content = Content.create(name: "hero-1", title: "un site responsive", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
  end



  context "validations" do

    it "is valid with valid attributes" do
      expect(@content).to be_a(Content)
      expect(@content).to be_valid
    end
    describe "name" do
      it "should not be valid without name" do
        bad_content = Content.create(title: "un site responsive", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        expect(bad_content).not_to be_valid
        expect(bad_content.errors.include?(:name)).to eq(true)
      end
    end

  end

  context "public instance methods" do

    describe "Content.name" do
      it 'should return a string' do
        expect(@content.name).to be_a(String)
      end
      it 'should return the name' do
        expect(@content.name).to eq('hero-1')
      end
    end
    describe "Content.title" do
      it 'should return a string' do
        expect(@content.title).to be_a(String)
      end
      it 'should return the name' do
        expect(@content.title).to eq('un site responsive')
      end
    end
    describe "Content.title" do
      it 'should return a string' do
        expect(@content.title).to be_a(String)
      end
      it 'should return the name' do
        expect(@content.title).to eq('un site responsive')
      end
    end
    describe "Content.body" do
      it 'should return a string' do
        expect(@content.body).to be_a(String)
      end
      it 'should return the name' do
        expect(@content.body).to eq('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      end
    end
  end

end