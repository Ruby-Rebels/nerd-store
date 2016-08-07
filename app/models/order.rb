class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_totals
    order_subtotal = 0
    carted_products.each do |cart_item|
      order_subtotal += cart_item.quantity * cart_item.product.price
    end
    self.subtotal = order_subtotal
    self.tax = order_subtotal * 0.09
    self.total = order_subtotal + self.tax
    self.save
  end
end
