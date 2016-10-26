module ProductsHelper
	def product_discount_info(product)
		if product.on_sale?
			return "More than #{product.discount_amount}% off!"
		end
	end

	def product_discount_amount(product)
		if product.on_sale?
			discounted_price = product.price_vnd - product.final_price
			if discounted_price > 100000
				return "Save over #{discounted_price} VND"
			end
		end
	end
end