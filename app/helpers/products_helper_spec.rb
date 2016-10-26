describe ProductsHelper do
	describe 'product_discount_info' do
		it 'More than 21% off' do
			product = FactoryGirl.create(:product, price_vnd: 150000)
			expect(product_discount_info(product)).to eq 'More than 21% off!'
		end

		it 'More than 31% off' do
			product = FactoryGirl.create(:product, price_vnd: 250000)
			expect(product_discount_info(product)).to eq 'More than 31% off!'
		end

		it 'More than 41% off' do
			product = FactoryGirl.create(:product, price_vnd: 850000)
			expect(product_discount_info(product)).to eq 'More than 41% off!'
		end
	end

	describe 'product_discount_amount' do
		it 'Save more than 41%' do
			product = FactoryGirl.create(:product, price_vnd: 850000)
			expect(product_discount_amount(product)).to eq "Save more than 350,000 VND"
		end

		it 'Save more than 31%' do
			product = FactoryGirl.create(:product, price_vnd: 250000)
			expect(product_discount_amount(product)).to eq nil
		end
	end
end