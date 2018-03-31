require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :current_order
  def initialize(menu = Menu.new, current_order = nil)
    @menu = menu
    @current_order = current_order
  end

  def show_menu
    @menu.print_menu
  end

  def order(item, quantity)
    @current_order = Order.new
    @current_order.add(item, @menu.dishes[item], quantity)
  end
end
