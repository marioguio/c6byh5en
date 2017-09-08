class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    products = Product.all
    render json: products
  end

  def new
    product = Product.new
  end
  def create
    product = Product.new(products_params)
    if product.save
      render json: product, status: 201
    else
      render json: {errors: product.errors}, status: 422
    end
  end

  def edit
     product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(products_params)
      render json: product, status: 200
    else
      render json: {errors: product.errors}, status: 422
    end
  end
  def destroy
		product = Product.find(params[:id])
    product.destroy
 			render status:204
  end

private
 def products_params
   params.require(:product).permit(:name, :price)
 end
end
