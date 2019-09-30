require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class User

  attr_reader :order_confirmed

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.menu
  end

  def select(item, quantity)
    @order.add_to_basket(item, quantity)
    "#{quantity} x #{item} added to order"
  end

  def view_order
    @order.order_summary
  end

  def total
    "£#{@order.order_total}"
  end

  def confirm
    Message.new.send_sms
    "Order sent to restaurant, confirmation text to follow"
  end
end
