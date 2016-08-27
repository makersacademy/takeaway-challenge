require_relative 'menu'

class FoodOrder
  attr_reader :order, :quantity, :price

  def initialize(order, quantity, price)
    @order = order
    @quantity = quantity
    @price = price
  end
end
