require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :menu, :total

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

  def choose_dish(dish, portions = 1)
    check_item_exists(dish)
    order.store_order(dish, portions)
  end

  def calculate_total
    order.current_order.each do |dish_name, dish_count|
      item_cost = dish_count * menu.the_menu[dish_name] # PORTIONS * COST
      @total += item_cost
    end
    @total
  end

  def place_order(expected)
    total_matches_expected?(expected)
    # SEND TEXT YO
  end

  private
  def total_matches_expected?(expected)
    raise "Your expected cost differs to the total cost of #{@total}" unless expected == @total
  end
  
  def check_item_exists(dish)
    raise "Item not on menu." unless menu.the_menu.key?(dish)
  end

end
