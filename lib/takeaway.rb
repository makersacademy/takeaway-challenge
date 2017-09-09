require_relative 'menu'
require_relative 'dishes'
require_relative 'sms'

class Takeaway

  attr_reader :order_list, :order_quantity, :sms

  def initialize
    @order_list = {}
    @order_quantity = 0
    @sms = sms
  end


  def order(dish, quantity)
    @order_list[dish] = quantity
    add_quantity(quantity)
  end

  def add_quantity(quantity)
    @order_quantity += quantity
  end

  def place_order
    sms.deliver
  end

end
