require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe "#submit" do
      before do
        @category = Category.find_or_create_by! name: 'Shrubs'

        @productAllGood = Product.create(:name => "Cecilia", :price => 42, :quantity => 6, :category => @category)
        @productNoName = Product.create(:price => 42, :quantity => 6, :category => @category)
        @productNoPrice = Product.create(:name => "Cecilia", :quantity => 6, :category => @category)
        @productNoQuant = Product.create(:name => "Cecilia", :price => 42, :category => @category)
        @productNoCategory = Product.create(:name => "Cecilia", :price => 42, :quantity => 6)
      end

      describe "product" do
        it "creates a product successfully when all 4 fields are provided" do
          expect(@productAllGood).to be_a_kind_of Product
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