require_relative "menu"
require_relative "order"
class Restaurant

  attr_reader :menu, :order

  def initialize(menu_object = Menu)
    @menu = menu_object.new
    @order = Order.new
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_order(dish, quantity = 1)
    @order.add(dish, quantity)
  end 
end 
