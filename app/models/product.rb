class Product < ApplicationRecord
	validates :product_name, :product_price, :product_stock, presence: true
	validates :product_price, numericality: true
end
