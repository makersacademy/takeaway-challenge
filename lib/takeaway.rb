require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def see_menu
    @menu = Menu.new
    @menu.print
  end

  def add_to_order(dish, quantity = 1)
    @order = Order.new
    @order.add(dish, quantity)
  end

end
