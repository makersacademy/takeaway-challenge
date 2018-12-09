require_relative 'order'

class Takeaway
  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def menu
    order.menu
  end

  def basket
    order.basket
  end

  def add_to_order(dish, amount = 1)
    order.add_to_basket(dish, amount)
  end

  def total
    order.total
  end
end
