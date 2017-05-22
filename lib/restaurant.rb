
require_relative './menu'
require_relative './printer'
require_relative './dish'
require_relative './order'
require_relative './messenger'
require_relative './errors'
require 'twilio-ruby'
require 'csv'

# This is the main interface, representing a takeaway restaurant.
class Restaurant
  attr_reader :name

  def initialize(name = "Monk's")
    @order = nil
    @name = name
    @menu = Menu.new
    @order_counter = 0
  end

  def add_dish(name, description, price)
    @menu.add_dishes(Dish.new(name, description, price))
  end

  def remove_dish(menu_number)
    dish_to_remove = @menu.dishes[menu_number - 1]
    @menu.remove_dishes(dish_to_remove)
  end

  def load_menu(path_to_menu)
    csv = CSV.read(path_to_menu)
    csv.each { |line| add_dish(line[0], line[1], line[2].to_f) }
    self.view_menu
    'Menu succesfully loaded'
  end

  def view_menu
    return 'The menu is currently empty!' if @menu.dishes.empty?
    @menu.show_menu
  end

  def order(menu_number, quantity = 1)
    raise(MenuError) if menu_number > @menu.dishes.count || menu_number < 1
    @order ||= Order.new
    @order_counter += 1 if @order.basket.empty?
    dish = @menu.dishes[menu_number - 1]
    @order.add_to_basket(dish, quantity)
  end

  def view_basket
    return 'Your basket is empty!' if @order.nil?
    @order.show_basket
  end

  def checkout(expected_order_total)
    @order.finalise(expected_order_total, @order_counter)
    @order = nil
  end

end
