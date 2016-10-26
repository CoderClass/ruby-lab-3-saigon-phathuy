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

describe 'On sale test' do
	it '<= 100,000 VND' do
		product = FactoryGirl.create(:product, price_vnd: 0)
		expect(product.discount_amount).to eq 0

		product = FactoryGirl.create(:product, price_vnd: 1)
		expect(product.discount_amount).to eq 0

		product = FactoryGirl.create(:product, price_vnd: 50000)
		expect(product.discount_amount).to eq 0

		product = FactoryGirl.create(:product, price_vnd: 99999)
		expect(product.discount_amount).to eq 0

		product = FactoryGirl.create(:product, price_vnd: 100000)
		expect(product.discount_amount).to eq 0
	end	

	it '> 100,000 VND and <= 200,000 VND' do
		product = FactoryGirl.create(:product, price_vnd: 100001)
		expect(product.discount_amount).to eq 21

		product = FactoryGirl.create(:product, price_vnd: 150000)
		expect(product.discount_amount).to eq 21

		product = FactoryGirl.create(:product, price_vnd: 199999)
		expect(product.discount_amount).to eq 21

		product = FactoryGirl.create(:product, price_vnd: 200000)
		expect(product.discount_amount).to eq 21
	end	

	it '> 200,000 VND and <= 800,000 VND' do
		product = FactoryGirl.create(:product, price_vnd: 200001)
		expect(product.discount_amount).to eq 31

		product = FactoryGirl.create(:product, price_vnd: 250000)
		expect(product.discount_amount).to eq 31

		product = FactoryGirl.create(:product, price_vnd: 799999)
		expect(product.discount_amount).to eq 31

		product = FactoryGirl.create(:product, price_vnd: 800000)
		expect(product.discount_amount).to eq 31
	end	

	it '> 800,000 VND' do
		product = FactoryGirl.create(:product, price_vnd: 800001)
		expect(product.discount_amount).to eq 41

		product = FactoryGirl.create(:product, price_vnd: 900000)
		expect(product.discount_amount).to eq 41
	end
end

describe 'Final price' do
	it 'round up' do
		product = FactoryGirl.create(:product, price_vnd: 115000)
		expect(product.final_price).to eq 120000

		product = FactoryGirl.create(:product, price_vnd: 115001)
		expect(product.final_price).to eq 120000

		product = FactoryGirl.create(:product, price_vnd: 119999)
		expect(product.final_price).to eq 120000

		product = FactoryGirl.create(:product, price_vnd: 120000)
		expect(product.final_price).to eq 120000
	end

	it 'round down' do
		product = FactoryGirl.create(:product, price_vnd: 114999)
		expect(product.final_price).to eq 110000

		product = FactoryGirl.create(:product, price_vnd: 113000)
		expect(product.final_price).to eq 110000

		product = FactoryGirl.create(:product, price_vnd: 110001)
		expect(product.final_price).to eq 110000

		product = FactoryGirl.create(:product, price_vnd: 110000)
		expect(product.final_price).to eq 110000
	end
end	

describe 'On sale' do
	it 'on sale' do
		product = FactoryGirl.create(:product, price_vnd: 110000)
		expect(product.on_sale?).to eq true
	end

	it 'not on sale' do
		product = FactoryGirl.create(:product, price_vnd: 10000)
		expect(product.on_sale?).to eq false
	end
end