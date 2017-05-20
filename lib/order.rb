# deals with the orders
class Order

  attr_reader :order_items

  def initialize
    @order_items = Hash.new{0}
  end

  def add_dish(dish, quantity = 1)
    @order_items[dish] += quantity
  end

end
