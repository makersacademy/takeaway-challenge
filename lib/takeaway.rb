require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Takeaway

  attr_reader :order, :menu, :total

  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu
    @order = order
    @text = text
    @total = 0
  end

  def show_menu
    menu.print_menu
  end

  def choose_dish(dish, portions = 1)
    check_item_exists(dish)
    order.store_order(dish, portions)
  end

  def calculate_total
    @total = order.current_order.map do |dish_name, dish_count|
      dish_count * menu.the_menu[dish_name]
    end.reduce(:+)
  end

  def place_order(expected)
    calculate_total if @total == 0
    total_matches_expected?(expected)
    @text.send
  end

  private
  def total_matches_expected?(expected)
    raise "Your expected cost differs to the total cost of #{@total}" unless expected == @total
  end

  def check_item_exists(dish)
    raise "Item not on menu." unless menu.the_menu.key?(dish)
  end

end
