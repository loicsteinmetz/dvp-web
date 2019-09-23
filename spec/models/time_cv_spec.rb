require 'rails_helper'

RSpec.describe TimeCv, type: :model do

  let(:valid_time) { TimeCv.create(date: 'test') }
  let(:valid_time_2) { TimeCv.create(date: 'test2') }
  let(:invalid_time) { TimeCv.create() }

  context 'validations' do

    describe 'valid params' do
      it 'should be valid' do
        expect(valid_time).to be_a(TimeCv)
        expect(valid_time).to be_valid
      end
    end

    describe 'invalid params' do
      it 'should not be valid whithout date' do
        expect(invalid_time).not_to be_valid
        expect(invalid_time.errors). to include(:date)
      end
      it 'should not be valid with a not unique date' do
        t = valid_time
        t2 = TimeCv.create(date: 'test')
        expect(t2).not_to be_valid
        expect(t2.errors). to include(:date)
      end
    end

  context 'associations' do

    describe 'instance is destroyed' do
      it 'should destroy associated cv_entries' do
        CvEntry.create(title: 'test', date: valid_time)
        valid_time.destroy
        expect(CvEntry.count).to eq(0)
      end
    end

  end

  context 'public instance methods'

    describe 'attributes' do
      it 'should provide the date' do
        expect(valid_time.date).to eq('test')
      end
      it 'should provide the order' do
        expect(valid_time.order).to eq(0)
      end
    end

  end

  context 'private methods' do

    describe 'set_new_order' do
      it 'should set order with the number of instances' do
        first = valid_time
        expect(valid_time_2.order).to eq(1)
      end
    end
    describe 'position tests for order update' do
      it 'should return correct values for first_place? and last_place?' do
        first = valid_time
        last = valid_time_2
        expect(first.first_place?).to be_truthy
        expect(last.last_place?).to be_truthy
      end
    end
    describe 'reorder_after_destroy' do
      it 'should reaffect correct order when destroy occur on an instance' do
        to_destroy = valid_time
        to_reorder = valid_time_2
        to_destroy.destroy
        expect(TimeCv.last.order).to eq(0)
      end
    end

  end

end