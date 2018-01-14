require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :order, :sms

  def initialize(menu = Menu.new, order = Order.new, sms = SMS.new)
    @order = order
    @sms = sms
    @menu = menu
  end

  def print_menu
    @menu.list
  end

  def order(dish, quantity)
    @order.add_item(dish, quantity)
  end

  def bill
    @order.total
  end

  def complete_order
    @sms.deliver
  end


end
