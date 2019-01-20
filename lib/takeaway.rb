require_relative 'menu'
require_relative 'order'
require_relative 'dish'
require_relative 'sms'

class Takeaway
  attr_reader :order, :sms

  def initialize(restaurant_menu, order = Order, sms = SMS)
    @order = order.new(restaurant_menu)
    @sms = sms.new
  end

  def print_menu
    @order.menu.print_menu
  end

  def add(dish, quantity)
    @order.add(dish, quantity)
  end

  def total
    @order.total
  end

  def receipt
    @order.receipt
  end

  def confirm_order
    sms.send(receipt)
  end

end
