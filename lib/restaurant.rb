require_relative "menu"
require_relative "order"
class Restaurant

  attr_reader :menu, :order

  def initialize(menu_class = Menu, order_class = Order)
    @menu = menu_class.new
    @order = order_class.new
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_order(dish, quantity = 1)
    @order.add(dish, quantity)
  end 

  def order_total
    @order.total(@order)
  end
end 
