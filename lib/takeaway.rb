require_relative 'menu'
require_relative 'order'


class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order_list = Order.new(@menu)
  end

  def show_menu
    menu.print_menu
  end

  def order(item, quanitity_needed)
    order.place_order(item, quanitity_needed)
  end

  def show_order
    order.show_order
  end




end
