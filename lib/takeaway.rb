require_relative 'menu'
require_relative 'order'

class Takeaway

  include Menu
  include PrettyFormat

  def initialize
    puts "\nWelcome to Shirt and Thai!\n"
    menu
  end

  def menu
    pretty_format(ALL_DISHES)
  end

  def order(dish, quantity, total_cost)
    raise "Total cost given does not match calculated order total" if order_error?(dish, quantity, total_cost)
    @order ||= Order.new
    @order.add(dish, quantity)
    confirm_add
  end

  def basket
    puts "CURRENT BASKET:\n"
    pretty_format(@order.basket, @order.total)
  end

  private

  def order_error?(dish, quantity, total_cost)
     (ALL_DISHES.values[(dish - 1)].to_f * quantity) != total_cost
  end

  def confirm_add
    menu
    puts "Item(s) successfully added to basket\n\n"
    basket
  end

end
