require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    describe "#create" do
      before do
        @userAllGood = User.create()
      end

      describe "user" do
        it "creates a user successfully when all 5 fields are provided" do
          expect(@productuserAllGoodAllGood).to be_a_kind_of User
        end
      end

      describe "product" do
        it "provides an appropriate error when product name is not specified" do
          expect(@productNoName.errors.full_messages).to include "Name can't be blank"
        end

        it "provides an appropriate error when product price is not specified" do
          expect(@productNoPrice.errors.full_messages).to include "Price can't be blank"
        end

        it "provides an appropriate error when product quantity is not specified" do
          expect(@productNoQuant.errors.full_messages).to include "Quantity can't be blank"
        end

        it "provides an appropriate error when product category is not specified" do
          expect(@productNoCategory.errors.full_messages).to include "Category can't be blank"
        end
      end
    end
  end
end