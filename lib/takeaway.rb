require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def view_menu
    @menu.menu
  end

  def add_item(item, quantity)
    @order.add_to_order(item, quantity)
  end

  def view_order
    @order.order_summary
    @order.basket_total
  end
end
