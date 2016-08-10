class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carted_products = current_user.carted_products.where(status: 'carted')
    if @carted_products.empty?
      flash[:info] = "Your cart is empty - check out some of these products!"
      redirect_to '/'
    end
  end

  def create
    CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: 'carted'
    )
    session[:cart_count] += 1
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: 'removed')
    session[:cart_count] = nil
    flash[:success] = "#{carted_product.product.name} was removed from your cart"
    redirect_to '/carted_products'
  end
end
