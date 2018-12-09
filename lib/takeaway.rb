require_relative 'order'

class Takeaway
  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def menu
    order.menu.dup
  end
end
