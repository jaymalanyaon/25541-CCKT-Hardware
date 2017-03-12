class StocksController < ApplicationController

layout 'general'

def restock
	@stock = Stock.new
	@products = Product.all
end

def process_restock
	@stock = Stock.new
	@product_tmp = Product.all
	@stock.stock_counter = params[:stock][:counter]
	@counter = @stock.stock_counter
		for i in 0..@counter do
			@stockName = params[:stock][:product_name][i]
			@stock.stock_quantity = params[:stock][:stock_quantity][i]
			@prodStock = @product_tmp.find_by(product_name: @stockName).product_stock
			@product_tmp.find_by(product_name: @stockName).update(product_stock: @prodStock.to_i + @stock.stock_quantity.to_i)
			i = i + 1
		end
	redirect_to "/products"
end

end
