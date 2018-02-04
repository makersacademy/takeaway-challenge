require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize(menu=Menu.new)
    @menu = menu
    @order = Order.new
  end

  def show_menu
    @menu.print_menu
  end

  def place_order(dish,quantity)
    @order.add(dish,quantity)
  end

end
