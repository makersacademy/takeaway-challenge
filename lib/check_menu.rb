require_relative './menu.rb'
require_relative './order.rb'

class CheckMenu
  include Menu

  attr_reader :order_status

  def initialize(menu = Menu::MENU, order_status = false)
    @menu = menu
    @order_status = order_status
  end

  def display_menu
    @menu
  end

  def send_order(order)
    @order_status = Order.new(order).check_order
    raise "Invalid order!" unless order_status
    place_order
  end

  def place_order
    require_relative '../send-sms.rb'
  end
end
