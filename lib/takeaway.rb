require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    @menu.print_menu
  end

  def add_item(dish, quantity)
    if @menu.on_menu?(dish)
    @order.add_to_order(dish, quantity)
    p @order.selection
    end
  end

end
