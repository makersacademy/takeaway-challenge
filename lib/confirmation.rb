#require 'make_order'
require_relative 'notify_customer'


class Confirmation

  attr_reader :order, :cost

  def initialize(order, cost)
    @order = order
    @cost = cost
  end

  def confirm_order
    order_information
    notify_customer = NotifyCustomer.new.send_sms
  end

private

  def order_information
    puts "Here is your order:"
    puts @order
    puts "The total cost of this order is £#{@cost}"
  end

end
