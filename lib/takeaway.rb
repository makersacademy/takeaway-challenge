require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def menu
    @order.inventory
  end

  def current_order
    @order.order
  end

  def add(dish)
    @order.add(dish)
  end

end
  