class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    carted_products = current_user.carted_products.where(status: 'carted')
    order = Order.create(
      user_id: current_user.id,
    )
    carted_products.update_all(order_id: order.id, status: 'purchased')
    order.calculate_totals
    session[:cart_count] = nil
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      @carted_products = @order.carted_products
    else
      redirect_to '/products'
    end
  end
end
