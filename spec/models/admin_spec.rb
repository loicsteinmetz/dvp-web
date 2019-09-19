require 'rails_helper'

RSpec.describe Admin, type: :model do

  before(:each) do 
    @admin = Admin.create(email: "email#{rand(999)}@email.com", password: 'testestest')
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@admin).to be_a(Admin)
      expect(@admin).to be_valid
    end

  end

  context "public instance methods" do

    describe "Admin.email" do
      it 'should return a string' do
        expect(@admin.email).to be_a(String)
      end
      it 'should return the email' do
        admin = Admin.create(email: "email1000@email.com", password: 'testestest')
        expect(admin.email).to eq('email1000@email.com')
      end
    end
    describe "Admin.encrypted_password" do
      it 'should return a string' do
        expect(@admin.encrypted_password).to be_a(String)
      end
      it 'should return an encrypted password' do
        expect(@admin.encrypted_password).not_to eql('testestest')
        expect(@admin.encrypted_password.size).to be > 20
      end
    end

  end

end