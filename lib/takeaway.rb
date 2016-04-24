require_relative 'order'
require_relative 'menu'

class Takeaway

  def initialize(menu = Menu.new, order = nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def print_menu
    menu.print
  end

  def place_order(dish, quantity)
    order.add(dish, quantity)
    order.total_price
  end


  attr_reader :menu, :order

end