require 'rails_helper'

RSpec.describe TimeCv, type: :model do

  before(:each) do 
    @time = TimeCv.create(date: '2012', order: 0)
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@time).to be_a(TimeCv)
      expect(@time).to be_valid
    end

    it 'should has many CvEntries' do
      expect(@time.entries).not_to eq(nil)
    end

    describe "date" do
      it "should not be valid without date" do
        bad_time = TimeCv.create(order: 0)
        expect(bad_time).not_to be_valid
        expect(bad_time.errors.include?(:date)).to eq(true)
      end
      it "should not be valid with not unique date" do
        TimeCv.create(date:'2012', order: 0)
        bad_time = TimeCv.create(date: '2012', order: 1)
        expect(bad_time).not_to be_valid
        expect(bad_time.errors.include?(:date)).to eq(true)
      end
    end
    describe "order" do
      it "should not be valid without order" do
        bad_time = TimeCv.create(date: '2012')
        expect(bad_time).not_to be_valid
        expect(bad_time.errors.include?(:order)).to eq(true)
      end
      it "should not be valid with not unique order" do
        TimeCv.create(date:'2012', order: 0)
        bad_time = TimeCv.create(date: '2012', order: 0)
        expect(bad_time).not_to be_valid
        expect(bad_time.errors.include?(:order)).to eq(true)
      end
    end

  end

  context "public instance methods" do

    describe "TimeCv.date" do
      it 'should return a string' do
        expect(@time.date).to be_a(String)
      end
      it 'should return the date' do
        expect(@time.date).to eq('2012')
      end
    end
    describe "TimeCv.order" do
      it 'should return a string' do
        expect(@time.order).to be_a(Integer)
      end
      it 'should return the order' do
        expect(@time.order).to eq(0)
      end
    end

  end

end