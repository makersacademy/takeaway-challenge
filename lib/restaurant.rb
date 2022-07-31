require_relative 'menu'

class Restaurant
  attr_accessor :order
  attr_reader :menu

  def initialize
    @order = nil
    @menu = Menu.new.list
  end

  def receive_order(order)
    @order = order
  end

  def confirm_order
    raise 'Restaurant has not received any orders' unless @order

    require './twilio'
    'Order submitted, confirmation text has been sent'
  end
end
