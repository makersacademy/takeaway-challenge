require 'menu'
require 'order'

class Takeaway

  def initialize(menu=Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def display_menu
    @menu.display_menu
  end

  def place_order
    @order.place_order
  end
end