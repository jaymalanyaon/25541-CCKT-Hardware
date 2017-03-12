class OrdersController < ApplicationController
	layout 'general'
	
	def index
		@orders = Order.all
	end

	def details
		@order = Order.find(params[:id])
			

	end

	def new_order
		@order = Order.new
		@product_list = Product.all
		@randomID = rand 10 ** 6
	end

	def add_order
		@product_tmp = Product.all
		@order = Order.new
		@order.order_id = params[:order][:order_id]
		@order.item_price= params[:order][:item_price]
		@prodQuantity = @order.item_price
		@order.order_date = params[:order][:order_date]
		@order.order_total = params[:order][:order_total]
			for i in 0..@prodQuantity do
				@prodName = params[:order][:product_name][i]
				@order.order_quantity = params[:order][:order_quantity][i]
				@prodStock = @product_tmp.find_by(product_name: @prodName).product_stock
				@product_tmp.find_by(product_name: @prodName).update(product_stock: @prodStock - @order.order_quantity )
				@order.save
				i = i + 1
			end
		redirect_to "/orders/#{@order.id}"
	end

	def delete
		@order = Order.find(params[:id])
		@order.delete

		redirect_to '/orders'
	end


end
