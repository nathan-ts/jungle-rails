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
          :email => "swordofthesinger@funeralparlour.com", 
          :password_confirmation => "ohmyshoe"
        )
        @userNoPwConfirm = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "swordofthesinger@funeralparlour.com", 
          :password => "ohmyshoe"
        )
        @userPwConfirmMismatch = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "swordofthesinger@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmamana"
        )
        @userDupeEmail = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "singersword@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmyshoe"
        )
        @userNoEmail = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmyshoe"
        )
        @userNoFirst = User.create(
          :last_name => "Yuzuriha",
          :email => "swordofthesinger@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmyshoe"
        )
        @userNoLast = User.create(
          :first_name => "Inori", 
          :email => "swordofthesinger@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmyshoe"
        )
        @userPwSort = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "swordofthesinger@funeralparlour.com", 
          :password => "ohmy",
          :password_confirmation => "ohmy"
        )
      end

      describe "user correct params validation" do
        it "creates a user successfully when all fields are provided correctly" do
          expect(@userAllGood).to be_a_kind_of User
        end
      end

      describe "user incorrect params validation" do
        it "provides an appropriate error when password is not provided" do
          expect(@userNoPw.errors.full_messages).to include "Password can't be blank"
        end

        it "provides an appropriate error when password confirmation is not provided" do
          expect(@userNoPwConfirm.errors.full_messages).to include "Password confirmation can't be blank"
        end

        it "provides an appropriate error when password does not match password confirmation" do
          expect(@userPwConfirmMismatch.errors.full_messages).to include "Password confirmation doesn't match Password"
        end

        it "provides an appropriate error when email already exists" do
          expect(@userDupeEmail.errors.full_messages).to include "Email has already been taken"
        end

        it "provides an appropriate error when email is not provided" do
          expect(@userNoEmail.errors.full_messages).to include "Email can't be blank"
        end

        it "provides an appropriate error when first name is not provided" do
          expect(@userNoFirst.errors.full_messages).to include "First name can't be blank"
        end

        it "provides an appropriate error when last name is not provided" do
          expect(@userNoLast.errors.full_messages).to include "Last name can't be blank"
        end
      end

      describe "user further incorrect params validation" do
        it "provides an appropriate error when password is shorter than min length" do
          expect(@userPwSort.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
        end
      end

      after(:all) do
        @userAllGood.destroy
      end
    end
  end

  describe '.authenticate_with_credentials' do
    describe "#login" do
      before(:all) do
        @user = User.create(
          :first_name => "Inori", 
          :last_name => "Yuzuriha", 
          :email => "singersword@funeralparlour.com", 
          :password => "ohmyshoe",
          :password_confirmation => "ohmyshoe"
        )
      end

      describe "user correct credentials validation" do
        it "logs in when correct credentials are passed in" do
          expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_a_kind_of User
        end
      end

      describe "user incorrect credentials validation" do
        it "provides an appropriate error when email is incorrect" do
          expect(User.authenticate_with_credentials("inori@funeral", @user.password)).to be_nil
        end

        it "provides an appropriate error when password is incorrect" do
          expect(User.authenticate_with_credentials(@user.email,"yuzuriha")).to be_nil
        end
      end

      describe "user edge case email validation" do
        it "logs in when email with leading and/or trailing whitespace is provided" do
          expect(User.authenticate_with_credentials("     singersword@funeralparlour.com  ", @user.password)).to be_a_kind_of User
        end

        it "logs in when email with inconsistent case is provided" do
          expect(User.authenticate_with_credentials("SingerSword@FuneralParlour.com", @user.password)).to be_a_kind_of User
        end
      end
      
      after(:all) do
        @user.destroy
      end
    end
  end
end