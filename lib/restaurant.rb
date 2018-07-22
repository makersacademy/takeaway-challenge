require_relative "menu"
require_relative "order"
class Restaurant

  attr_reader :menu

  def initialize(menu_object = Menu)
    @menu = menu_object.new
    @order = order.new
  end

  def print_menu
    @menu.print_menu
  end

  def select(dish_name, quantity = 1)
    @order.add_to_order(dish_name, quantity)
  end 
end 
