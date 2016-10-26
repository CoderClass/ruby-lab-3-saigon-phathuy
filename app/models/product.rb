class Product < ActiveRecord::Base
	before_save :set_default_image_path
	validates :name, presence: true

	def discount_amount
		if price_vnd > 800000
			return 41
		elsif price_vnd > 200000
			return 31
		elsif price_vnd > 100000
			return 21
		else
			return 0
		end
	end

	def final_price
		return (price_vnd * (100 - discount_amount) / 100 / 10000).round * 10000
	end

	def on_sale?
		return discount_amount > 0
	end

	private

	def set_default_image_path
		self.image_path ||= "http://lorempixel.com/200/200/fashion"
	end

	def self.alphabetical
		return Product.all.order(:name)
	end

end
