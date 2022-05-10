require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    describe "#create" do
      before(:all) do
        @userAllGood = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "singersword@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmyshoe"
        )
        @userNoPw = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "singersword@funeralparlour.com", 
        )
        @userPwConfirm = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "singersword@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmamana"
        )
      end

      describe "user" do
        it "creates a user successfully when all fields are provided correctly" do
          expect(@userAllGood).to be_a_kind_of User
        end
      end

      describe "user" do
        it "provides an appropriate error when password and/or pw confirmation are not provided" do
          expect(@userNoPw.errors.full_messages).to include "Password can't be blank"
        end

        xit "provides an appropriate error when password does not match pw confirmation" do
          $stderr.puts "user pw != pw confirm"
          expect(@userPwConfirm.errors.full_messages).to include "Password and Password Confirmation do not match"
        end
      end

      after(:all) do
        @userAllGood.destroy
        @userNoPw.destroy
        @userPwConfirm.destroy
      end
    end
  end
end