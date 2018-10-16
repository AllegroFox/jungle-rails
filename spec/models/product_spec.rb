require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should pass all validations' do
      @category = Category.new(name: 'socks')
      @product = Product.new(name: 'Fox Socks', description: 'Fuzzy feet holders', price: '14.99', quantity: '490', category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.new(name: 'socks')
      @product = Product.new(name: nil)
      expect(@product).to_not be_valid
    end

    it 'is not valid without a price' do
      @category = Category.new(name: 'socks')
      @product = Product.new(name: 'Fox Socks', description: 'Fuzzy feet holders', price: nil)
      expect(@product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @category = Category.new(name: 'socks')
      @product = Product.new(name: 'Fox Socks', description: 'Fuzzy feet holders', price: '14.99', quantity: nil)
      expect(@product).to_not be_valid
    end


    it 'is not valid without a category' do
      @category = Category.new(name: 'socks')
      @product = Product.new(name: 'Fox Socks', description: 'Fuzzy feet holders', price: '14.99', quantity: '490', category: nil)
      expect(@product).to_not be_valid
    end

  end
end
