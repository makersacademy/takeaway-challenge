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

end
