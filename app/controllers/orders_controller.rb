class OrdersController < ApplicationController
  def create
    order = Order.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id]
    )
    order.calculate_totals




    # order.subtotal = params[:quantity] * order.product.price
    # order.tax = 0.09 * order.subtotal
    # order.total = order.subtotal + order.tax
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @product = @order.product
    @image = @product.images.first
  end
end
