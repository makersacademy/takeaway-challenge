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

  def order(dish, quantity)
    @order.add_item(dish, quantity)
    @order.total
  end


end
