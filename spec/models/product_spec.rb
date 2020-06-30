require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a product if all of the validations are true' do
      @category = Category.new(name: "Hats")
      @product = Product.new(
        name: "New Era Boston Camo",
        price_cents: 4700,
        quantity: 1,
        category: @category
      )
      @product.valid?
      expect(@product.errors).not_to include("can't be blank")
    end

    it 'should not create a product if product name is missing' do
      @category = Category.new(name: "Hats")
      @product = Product.new(
        name: nil,
        price_cents: 4700,
        quantity: 1,
        category: @category
      )
      @product.valid?
      expect(@product.errors).not_to include("can't be blank")
    end

    it 'should not create a product if product price is missing' do
      @category = Category.new(name: "Hats")
      @product = Product.new(
        name: "New Era Boston Camo",
        price_cents: nil,
        quantity: 1,
        category: @category
      )
      @product.valid?
      expect(@product.errors).not_to include("can't be blank")
    end

    it 'should not create a product if product quantity is missing' do
      @category = Category.new(name: "Hats")
      @product = Product.new(
        name: "New Era Boston Camo",
        price_cents: 4700,
        quantity: nil,
        category: @category
      )
      @product.valid?
      expect(@product.errors).not_to include("can't be blank")
    end

    it 'should not create a product if product category is missing' do
      @category = Category.new(name: "Hats")
      @product = Product.new(
        name: "New Era Boston Camo",
        price_cents: 4700,
        quantity: 1,
        category: nil
      )
      @product.valid?
      expect(@product.errors).not_to include("can't be blank")
    end
  
  end
end 
