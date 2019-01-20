require_relative 'menu'
require_relative 'order'

class Restaurant
  attr_reader :menu
  attr_accessor :current_order
  def initialize(menu = Menu.new, current_order = Order.new)
    @menu = menu
    @current_order = current_order
    @total_order_value = 0

  end

  def display_menu
    @menu.menu_items
  end

  def order(item, quantity = 1)
    @current_order.add(item, quantity)
    @total_order_value += @menu.menu_items["#{item}"]

  end

  def get_total
    @total_order_value
  end
  def print_total
    "You owe Rat Cafe £#{@total_order_value}. Please pay now."
  end
end
