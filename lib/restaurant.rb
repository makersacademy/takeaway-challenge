require_relative './order.rb'
require_relative './menu.rb'
require_relative './display.rb'

class Restaurant
  include Display
  attr_reader :current_order

  def initialize(menu = Menu.new, order = Order.new, name = "Woahaca")
    @menu = menu
    @current_order = order
    welcome_message(name)
  end

  def view_menu
    @menu.show_menu
  end

  def add_order(dish, quantity = 1)
    @current_order.add_dish(dish,quantity)
  end

  def remove_order(dish, quantity = 1)
    @current_order.remove_dish(dish,quantity)
  end

  def order_summary
    @current_order.review_order
  end
end
