class Product < ActiveRecord::Base
  belongs_to :supplier

  def sale_message
    if price.to_i < 2
      "Discount Item!"
    else
      "Not on Sale!"
    end
  end

  def tax
    price.to_i * 0.09
  end

  def total
    tax + price.to_i
  end
end
