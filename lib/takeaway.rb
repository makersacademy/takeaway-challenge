require 'rubygems'

class Takeaway
  attr_reader :order_klass, :order, :order_time, :menu, :credentials, :sms

  def initialize(order_klass=Order, menu_klass=Menu.new.list, sms=SMS.new)
    @order_klass = order_klass
    @order = nil
    @menu = menu_klass
    @sms = sms
  end

  def view_menu
    menu.print
  end

  def create_order(menu_klass)
    @order = order_klass.new(menu)
  end

  def place_order(order, total, phone_number)
    fail "Wrong total!" if total != order.calculate_cost(order)
    order_time = Time.new + 3600
    sms.send_sms(order_time, phone_number)
  end
end
