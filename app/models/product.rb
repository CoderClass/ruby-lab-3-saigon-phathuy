class Product < ActiveRecord::Base
	before_save :set_default_image_path
	validates :name, presence: true

	def discount_amount
		if self.price_vnd > 800000
			return 41
		elsif self.price_vnd > 200000
			return 31
		elsif self.price_vnd > 100000
			return 21
		else
			return 0
		end
	end

	def final_price
		return (self.price_vnd / 10000).round * 10000
	end

	private

	def set_default_image_path
		self.image_path ||= "http://lorempixel.com/200/200/fashion"
	end

	def self.alphabetical
		return Product.all.order(:name)
	end

end
