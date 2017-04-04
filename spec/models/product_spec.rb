require 'rails_helper'

RSpec.describe Product, type: :model do
  def valid_attributes(new_attributes)
    attributes = {
      title: "Laptop",
      Description: "Cool Computer",
      price: 100
    }

    attributes.merge(new_attributes)
  end

  describe "validation" do
    context "title" do
      it 'requires a title' do
      product = Product.new(valid_attributes({ title: nil}))
      expect(product).to be_invalid
      end

      it 'requires a unique titles' do
        product = Product.new(valid_attributes({ title: "laptop"}))
        product2 = Product.new(valid_attributes({ title: "laptop"}))
        product.save
        expect(product2).to be_invalid
      end

      it 'capitalize the title after getting saved' do
        product = Product.new(valid_attributes({ title: "hello jello"}))
        product.save
        expect(product.title).to eq('Hello jello')
      end
    end

    context 'Description' do
      it 'requires a Description' do
        product = Product.new(valid_attributes({ Description: nil }))
        expect(product).to be_invalid
      end
    end

  context 'price' do
    it 'requires a price' do
      product = Product.new(valid_attributes({price:nil}))
      expect(product).to be_invalid
    end

  it "requires the price to be greater than 0" do
   product = Product.new(valid_attributes({price: -1}))
   product.save
   expect(product.errors.messages).to have_key(:price)
    end
   end
  end
end
