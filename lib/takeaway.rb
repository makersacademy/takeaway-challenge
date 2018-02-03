require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @order = Order.new
  end

  def see_menu
    @menu = Menu.new
    @menu.print
  end

  def add_to_order(dish, quantity = 1)
    @order.add(dish, quantity)
  end

end
