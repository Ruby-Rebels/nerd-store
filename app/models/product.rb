class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true

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
