require 'rails_helper'

RSpec.feature "OnSaleViews", type: :feature do

	def hat_links
		page.all(:css, "h4.product-name a").map(&:text)
	end

	scenario 'test sale 21%' do
		product = FactoryGirl.create(:product, price_vnd: 150000)

		visit root_path
    expect(page).to have_content "More than 21% off!"
  end

	scenario 'test sale 31%' do
		product = FactoryGirl.create(:product, price_vnd: 250000)

		visit root_path
    expect(page).to have_content "More than 31% off!"
  end

	scenario 'test sale 41%' do
		product = FactoryGirl.create(:product, price_vnd: 850000)

		visit root_path
    expect(page).to have_content "More than 41% off!"
  end
end
