require_relative './menu.rb'
require_relative './order.rb'

class CheckMenu
  include Menu

  def initialize(menu = Menu::MENU)
    @menu = menu
  end

  def display_menu
    @menu
  end

  def send_order(order)
    order_status = Order.new(order).check_order
  end
end
