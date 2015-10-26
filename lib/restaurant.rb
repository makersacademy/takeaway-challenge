require './lib/menu.rb'
require './lib/order.rb'
require './lib/twilio.rb'

class Restaurant

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def total_correct(total)
    total == order.total
  end

  def place_order(list=basket_list, total)
    fail "Order is empty" if list.empty?
    fail "Total is not correct" unless total_correct(total)
    send_text
  end

  def basket_list
    order.basket
  end
end
