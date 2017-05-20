
require_relative './menu'
require_relative './printer'
require_relative './dish'
require_relative './order'
require_relative './messenger'
require 'twilio-ruby'

# This is the main interface, representing a takeaway restaurant.
class Restaurant

  def initialize(name = "Monk's")
    @name = name
    @menu = Menu.new
  end

  def add_dish(name, description, price)
    @menu.add_dishes(Dish.new(name, description, price))
  end

  def remove_dish(menu_number)
    dish_to_remove = @menu.dishes[menu_number - 1]
    @menu.remove_dishes(dish_to_remove)
  end

  def view_menu
    @menu.show_menu
  end

  def add_to_order(menu_number, quantity = 1)
    @order ||= Order.new
    dish = @menu.dishes[menu_number - 1]
    @order.add_to_order(dish, quantity)
  end

  def view_order
    @order.show_order
  end

  def finalise_order(expected_order_total)
    @order.finalise(expected_order_total)
    @order = nil
  end

end
