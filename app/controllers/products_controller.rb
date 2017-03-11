class ProductsController < ApplicationController
  layout 'general'
  
  def index
  	@products = Product.all
  end

  def details
  	@product = Product.find(params[:id])
  end

  def newproduct
  	@product = Product.new
    @randomID = rand 10 ** 7
  end

  def add_product
  	@product = Product.new
  	@product.product_id = params[:product][:product_id]
  	@product.product_name = params[:product][:product_name]
  	@product.product_price = params[:product][:product_price]
  	@product.product_stock = params[:product][:product_stock]
  	@product.save

  	redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def find
    @sproduct = params[:product_search]
    @products = Product.where(product_name: @sproduct)

    render "index"

  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(user_params)
      redirect_to "/products/#{@product.id}"
    else 
      render 'edit'
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to '/products'
  end

  private
    def user_params
      params.require(:product).permit(:product_name, :product_price, :product_stock)
    end
end
