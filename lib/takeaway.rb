require_relative 'menu'
require_relative 'order'

class Takeaway
  # attr_accessor :order
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.prices
  end

  def select_order(order, quantity)
    @order.add_to_order(order, quantity)
  end

  def basket
    @order.basket
  end
end
