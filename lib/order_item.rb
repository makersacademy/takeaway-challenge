require_relative 'dish'

class OrderItem

  attr_reader :dish, :quantity
  MINIMUM_ORDER = 1

  def initialize(dish, quantity = MINIMUM_ORDER)
    @dish = dish
    @quantity = quantity
  end
end