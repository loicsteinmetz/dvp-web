require 'rails_helper'

RSpec.describe Folio, type: :model do

  before(:each) do 
    @folio = Folio.new(title: "website", website: "https://website.com", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
    @folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
    @folio.save
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@folio).to be_a(Folio)
      expect(@folio).to be_valid
    end
    describe "title" do
      it "should not be valid without title" do
        bad_folio = Folio.new(website: "https://website.com", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:title)).to eq(true)
      end
    end
    describe "website" do
      it "should not be valid without website" do
        bad_folio = Folio.new(title: "website", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:website)).to eq(true)
      end
      it "should not be valid with website in a wrong format" do
        bad_folio = Folio.new(title: "website", website: "website", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:website)).to eq(true)
      end
    end
    describe "work" do
      it "should not be valid without work" do
        bad_folio = Folio.new(title: "website", website: "https://website.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:work)).to eq(true)
      end
    end
    describe "description" do
      it "should not be valid without description" do
        bad_folio = Folio.new(title: "website", website: "https://website.com", work: "Lorem ipsum dolor sit amet", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:description)).to eq(true)
      end
    end
    describe "techs" do
      it "should not be valid without techs" do
        bad_folio = Folio.new(title: "website", website: "https://website.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", work: "Lorem ipsum dolor sit amet", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:techs)).to eq(true)
      end
    end
    describe "description_mini" do
      it "should not be valid without description_mini" do
        bad_folio = Folio.new(title: "website", website: "https://website.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", work: "Lorem ipsum dolor sit amet", order: 1, techs: "Ruby, JS, Html, Rails, etc...")
        bad_folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:description_mini)).to eq(true)
      end
    end
    describe "capture" do
      it "should not be valid without capture" do
        bad_folio = Folio.new(title: "website", website: "https://website.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", work: "Lorem ipsum dolor sit amet", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: 1)
        bad_folio.save
        expect(bad_folio).not_to be_valid
        expect(bad_folio.errors.include?(:capture)).to eq(true)
      end
    end

  end

  context "public instance methods" do

    describe "Folio.title" do
      it 'should return a string' do
        expect(@folio.title).to be_a(String)
      end
      it 'should return the name' do
        expect(@folio.title).to eq('website')
      end
    end
    describe "Folio.website" do
      it 'should return a string' do
        expect(@folio.website).to be_a(String)
      end
      it 'should return the website' do
        expect(@folio.website).to eq('https://website.com')
      end
    end
    describe "Folio.description" do
      it 'should return a string' do
        expect(@folio.description).to be_a(String)
      end
      it 'should return the name' do
        expect(@folio.description).to eq('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      end
    end
    describe "Folio.description_mini" do
      it 'should return a string' do
        expect(@folio.description_mini).to be_a(String)
      end
      it 'should return the description_mini' do
        expect(@folio.description_mini).to eq('Lorem ipsum dolor sit amet, consectetur adipiscing elit')
      end
    end
    describe "Folio.techs" do
      it 'should return a string' do
        expect(@folio.techs).to be_a(String)
      end
      it 'should return the techs' do
        expect(@folio.techs).to eq('Ruby, JS, Html, Rails, etc...')
      end
    end
    describe "Folio.work" do
      it 'should return a string' do
        expect(@folio.work).to be_a(String)
      end
      it 'should return the work' do
        expect(@folio.work).to eq('Lorem ipsum dolor sit amet')
      end
    end
    describe "Folio.order" do
      it 'should return an integer' do
        expect(@folio.order).to be_a(Integer)
      end
      it 'should return the order' do
        expect(@folio.order).to eq(1)
      end
    end
    describe "Folio.capture" do
      it 'should return an active storage object' do
        expect(@folio.capture).to be_a(ActiveStorage::Attached::One)
      end
    end

  end

end