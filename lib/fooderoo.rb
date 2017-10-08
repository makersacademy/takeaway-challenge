require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Fooderoo
  attr_reader :menu, :order
  def initialize
    @order = Order.new SendSms
    @menu = Menu.new order
  end

  def show_menu
    menu.show
  end

  def select dish_name, quantity
    menu.select dish_name, quantity
  end

  def check_order customer_total
    order.check customer_total
  end
end
