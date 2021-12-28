require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
    @order = Order.new(menu)
  end

  def display_menu
    puts @menu.print_menu
  end

  def order(item, quantity)
    @order.add_item(item, quantity)
    @order.basket
  end

  def display_total
    puts "* Total ..... £#{sprintf('%.2f', @order.calculate_total)} *"
  end

end
