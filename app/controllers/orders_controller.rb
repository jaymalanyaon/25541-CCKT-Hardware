class OrdersController < ApplicationController
	layout 'general'
	
	def index
		@orders = Order.all

	end

	def details
		@order = Order.find(params[:id])

		@product_list = OrderProductItem.where(:ord_id => @order.order_id)
		@prices = []
		@product_list.each do |item|
			@prices.push(Product.find_by(product_name: item.prod_name).product_price)
		end

		# @products = Product.all
		# @list = @product_list.where(order_id: @order.order_id)

		# render :text => @tmp.product_stock.inspect
		# @list = $listTmp

	end

	def new_order
		@order = Order.new
		@product_list = Product.all
		@randomID = rand 10 ** 6
	end

	def add_order
		@products = Product.all

		@order = Order.new
		@order.order_id = params[:order][:order_id]
		@order.order_date = params[:order][:order_date]
		@order.order_total = params[:order][:order_total]
		@order.save

		@c = 0
		params[:order][:product_name].each do |item|
			# Create a new row in Order_product_List
			@product_item = OrderProductItem.new
			@product_item.ord_id = params[:order][:order_id]
			@product_item.prod_name = params[:order][:product_name][@c]
			@product_item.quant = params[:order][:order_quantity][@c]
			@product_item.save

			# Update Product Stock
			@current_stock = @products.find_by(product_name: item).product_stock
			@products.find_by(product_name: item).update(product_stock: @current_stock - params[:order][:order_quantity][@c].to_i)

			@c = @c + 1
		end
		# render :text => params[:order][:product_name].inspect
		# render :text => @c.inspect
		
		# @product_tmp = Product.all
		# @order = Order.new
		# @purchased_productName = []
		# @listTmp = []
		# @order.order_id = params[:order][:order_id]
		# @order.item_price = params[:order][:item_price]
		# @prodQuantity = @order.item_price
		# @order.order_date = params[:order][:order_date]
		# @order.order_total = params[:order][:order_total]
		# 	for i in 0..@prodQuantity do
		# 		@prodName = params[:order][:product_name][i]
		# 		@purchased_productName[i] = @prodName
		# 		@order.order_quantity = params[:order][:order_quantity][i]
		# 		@prodStock = @product_tmp.find_by(product_name: @prodName).product_stock
		# 		@product_tmp.find_by(product_name: @prodName).update(product_stock: @prodStock - @order.order_quantity )
		# 		@order.save
		# 		i = i + 1
		# 	end

		# $listTmp = @purchased_productName
		redirect_to "/orders/#{@order.id}"

	end

	def delete
		@order = Order.find(params[:id])
		@order.delete

		redirect_to '/orders'
	end


end
