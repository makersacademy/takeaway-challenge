require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.list
  end

  def order_item(item, quantity = 1)
    @order.add_item(item, quantity)
    "You have ordered #{item}!"
  end


end
