require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new
    @total = 0
    # puts "Welcome to the takeaway ordering application."
    # puts "Type \"<OBJECT_NAME>.show_menu\" to view the menu."
    # puts "Type \"<OBJECT_NAME>.place_order(dish, portions)\" to order."
  end

  def show_menu
    # puts "Please pick your desired dishes from the following options:"
    menu.restaurant_menu.each_with_index do |(key, val), ind|
      puts "#{ind+1}: #{key} -- £#{val}"
    end
  end

  def place_order(dish, portions = 1)
    raise "Item not on menu." unless menu.restaurant_menu.key?(dish)
    order.store_order(dish, portions)
    order.current_order
  end

  def calculate_total
    order.current_order.each do |key, val|
      item_cost = val * menu.restaurant_menu[key] # TIMES PORTIONS BY COST
      @total += item_cost
    end
    @total
  end

end
