require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '.alphabetical' do
	it "returns [] when there are no products" do
	  expect(Product.alphabetical).to eq([])
	end

	it "returns [a] when there is only one product a" do
	  a = Product.create!(name: 'a', description: 'description', image_path: '', price_vnd: 50, weight: 1)
	  expect(Product.alphabetical).to eq([a])
	end

	it "returns [a,b,c] after I create 3 products c, b, a" do
	  c = Product.create!(name: 'c', description: 'description', image_path: '', price_vnd: 50, weight: 1)
	  b = Product.create!(name: 'b', description: 'description', image_path: '', price_vnd: 50, weight: 1)
	  a = Product.create!(name: 'a', description: 'description', image_path: '', price_vnd: 50, weight: 1)
	  expect(Product.alphabetical).to eq([a,b,c])
	end
end