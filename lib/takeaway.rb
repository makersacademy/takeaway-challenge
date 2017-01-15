require_relative 'menu'
require_relative 'order'

class Takeaway

  include Menu
  include PrettyFormat

  def initialize
    puts "\nWelcome to Shirt and Thai!\n"
    menu
  end

  def order(dish, quantity, total_cost)
    @order ||= Order.new
    @order.add(dish, quantity, total_cost)
    menu
    basket
  end

  def menu
    pretty_format(ALL_DISHES)
  end

  def basket
    pretty_format(@order.basket, @order.total)
  end

end

# require 'pry'
# binding.pry
# m = Takeaway.new
# m.view_menu
