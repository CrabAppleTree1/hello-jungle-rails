require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should accept a valid product" do
      category = Category.new()
      product = category.products.new({
        name:  'Classy shirt',
        quantity: 10,
        price: 64.99
      })
      expect(product).to be_valid 
    end
    it "should not accept a missing name" do
      category = Category.new()
      product = category.products.new({
        quantity: 10,
        price: 64.99
      })
      expect(product).to_not be_valid 
    end
    it "should not accept a missing price" do
      category = Category.new()
      product = category.products.new({
        name:  'Classy shirt',
        quantity: 10,
        # price: 64.99
      })
      expect(product).to_not be_valid 
    end
    it "should not accept a missing quantity" do
      category = Category.new()
      product = category.products.new({
        name:  'Classy shirt',
        price: 64.99
      })
      expect(product).to_not be_valid 
    end
    it "should not accept a missing category" do
      product = Product.new({
        name:  'Classy shirt',
        quantity: 10,
        price: 64.99
      })
      expect(product).to_not be_valid 
    end
  end
end