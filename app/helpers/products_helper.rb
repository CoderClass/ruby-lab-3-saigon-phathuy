module ProductsHelper
	def product_discount_info(product)
		if product.on_sale?
			return "More than #{product.discount_amount}% off!"
		end
	end
end