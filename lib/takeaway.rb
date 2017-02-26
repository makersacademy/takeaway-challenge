require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new
    # puts "Welcome to the takeaway ordering application."
    # puts "Type \"<OBJECT_NAME>.show_menu\" to view the menu."
    # puts "Type \"<OBJECT_NAME>.place_order(dish, portions)\" to order."
  end

  def show_menu
    # puts "Please pick your desired dishes from the following options:"
    @menu.restaurant_menu
  end

  def place_order(dish, portions = 1)
    @order.store_order(dish, portions)
    @order.current_order
  end

end
