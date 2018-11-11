require_relative 'menu'
require_relative 'order'

class TakeAway

  def initialize
    @menu = Menu.new
    @current_order = Order.new
  end

  def view_menu
    @menu.view
  end

  def add_to_order(menu_num, quantity = 1)
    @current_order.add(menu_num, quantity)
  end

  def empty_basket
    @current_order = Order.new
    "Basket emptied"
  end

  def check_basket
    @current_order.view_basket
  end

  def submit_order
    @current_order.submit
  end

end
