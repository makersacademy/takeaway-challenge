require_relative 'order'
require_relative 'menu'
require_relative 'sms'

class Takeaway

  #In charge of everything and delegating responsibilites to smaller classes!

  attr_reader :menu, :order, :sms

  def initialize(menu = Menu.new, order = Order.new, sms = SMS.new)
    @menu = menu
    @order = order
    @sms = sms
  end

  def read_menu
    menu.options
  end

  def add_food_to_order(food, quantity = 1)
    order.select_food(food, quantity)
  end

  def show_order
    order.current_order_string + "Total = #{order.running_total.to_s}"
  end

  def place_order
   sms.send_message
  end
end
