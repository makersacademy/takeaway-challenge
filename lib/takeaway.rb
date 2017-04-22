require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def see_menu
    menu.print_menu
  end

  def add_to_order(item)
    new_order if @current_order == nil
    @current_order.add_item(item)
  end

  def check_order
    @current_order.calculate_total
  end

  def new_order
    @current_order = Order.new(@menu)
  end

  def end_order
    @current_order = nil
  end

end
