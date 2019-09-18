require 'rails_helper'

RSpec.describe CvEntry, type: :model do

  before(:each) do 
    @time = TimeCv.create(date:'2012')
    @entry = CvEntry.create(date: @time, title: "DUT informatique", sub: "IUT Nancy Charlemagne")
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@entry).to be_a(CvEntry)
      expect(@entry).to be_valid
    end
    describe "time" do
      it "should not be valid without date" do
        bad_entry = CvEntry.create(title: "DUT informatique", sub: "IUT Nancy Charlemagne")
        expect(bad_entry).not_to be_valid
        expect(bad_entry.errors.include?(:date)).to eq(true)
      end
    end
    describe "title" do
      it "should not be valid without title" do
        bad_entry = CvEntry.create(date: @time, sub: "IUT Nancy Charlemagne")
        expect(bad_entry).not_to be_valid
        expect(bad_entry.errors.include?(:title)).to eq(true)
      end
      it "should not be valid with a title which is not unique" do
        CvEntry.create(title: "DUT informatique", date: @time, sub: "IUT Nancy Charlemagne")
        bad_entry = CvEntry.create(title: "DUT informatique", date: @time, sub: "IUT Nancy Charlemagne")
        expect(bad_entry).not_to be_valid
        expect(bad_entry.errors.include?(:title)).to eq(true)
      end
    end

  end

  context "public instance methods" do

    describe "CvEntry.title" do
      it 'should return a string' do
        expect(@entry.title).to be_a(String)
      end
      it 'should return the name' do
        expect(@entry.title).to eq("DUT informatique")
      end
    end
    describe "CvEntry.date" do
      it 'should return a TimeCv object' do
        expect(@entry.date).to be_a(TimeCv)
      end
      it 'should return the date category' do
        expect(@entry.date).to eq(@time)
      end
    end
    describe "CvEntry.sub" do
      it 'should return a string' do
        expect(@entry.sub).to be_a(String)
      end
      it 'should return the sub' do
        expect(@entry.sub).to eq('IUT Nancy Charlemagne')
      end
    end
  end

end