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
    menu.print_menu
  end

  def place_order(dish, portions = 1)
    check_item_exists(dish)
    order.store_order(dish, portions)
  end

  def calculate_total
    order.current_order.each do |key, val|
      item_cost = val * menu.the_menu[key] # PORTIONS * COST
      @total += item_cost
    end
    @total
  end

  def total_matches_expected?(expected)
    expected == @total
  end

  private
  def check_item_exists(dish)
    raise "Item not on menu." unless menu.the_menu.key?(dish)
  end

end
