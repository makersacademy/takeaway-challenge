require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
  end

  def menu
    @menu.display_menu
  end

  def order(order)
    @order_class.new(order)
  end

  def dispatch

  end

end
