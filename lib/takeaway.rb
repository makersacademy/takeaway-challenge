require_relative 'order'
require_relative 'menu'

class Takeaway
  attr_reader :order, :menu

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def add_to_list(food, price)
    @order.add(food, price)
  end
end
