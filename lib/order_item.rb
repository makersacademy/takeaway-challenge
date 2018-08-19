require_relative "order"

class OrderItem
  attr_reader :number, :dish, :price, :quantity

  def initialize(number, dish, price, quantity)
    @number = number
    @dish = dish
    @price = price
    @quantity = quantity
  end
end
