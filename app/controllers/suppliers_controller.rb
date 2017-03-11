class SuppliersController < ApplicationController
  layout 'general'
  
  def index
    @suppliers = Supplier.all
  end

  def details
    @supplier = Supplier.find(params[:id])  
  end

  def newsupplier
    @supplier = Supplier.new
    @randomIDsup = rand 10 ** 5
    @randomIDprod = rand 10 ** 5
  end

  def add_supplier
    @supplier = Supplier.new
    @product = Product.new
    @supplier.supplier_id = params[:supplier][:supplier_id]
    @supplier.supplier_name = params[:supplier][:supplier_name]
    @supplier.supplier_address = params[:supplier][:supplier_address]
    @supplier.shipment_date = params[:supplier][:shipment_date]
    @supplier.shipment_amount = params[:supplier][:shipment_amount]
    @product.product_id = params[:product][:product_id]
    @product.product_name = params[:product][:product_name]
    @product.product_price = params[:product][:product_price]
    @product.product_stock = params[:product][:product_stock]
    @product.save
    @supplier.save

    redirect_to "/suppliers/#{@supplier.id}"
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(user_params)
      redirect_to "/suppliers/#{@supplier.id}"
    else 
      render 'edit'
    end
  end

  def restock
    @restocker = Supplier.new
    @product_list = Product.all
  end

  def process_restock
    @product_tmp = Product.all
    @order = Order.new
    @order.item_price= params[:order][:item_price]
    @prodQuantity = @order.item_price
    @order.order_total = params[:order][:order_total]
      for i in 0..@prodQuantity do
        @prodName = params[:order][:product_name][i]
        @order.order_quantity = params[:order][:order_quantity][i]
        @prodStock = @product_tmp.find_by(product_name: @prodName).product_stock
        @product_tmp.find_by(product_name: @prodName).update(product_stock: @prodStock + @order.order_quantity )
        i = i + 1
      end
    redirect_to "/suppliers"
  end

  def delete
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    redirect_to '/suppliers'
  end

  private
    def user_params
      params.require(:supplier).permit(:supplier_name, :supplier_address, :shipment_date, :shipment_amount)
    end

end