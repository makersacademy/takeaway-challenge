require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

class Takeaway

  attr_reader :menu, :order, :total_confirmation

  def initialize
    @menu = Dishes.new
    @order = Order.new
  end

  def print_menu
    @menu.list
  end

  def select(dish, quantity = 1)
    @order.current[dish] = @menu.list[dish] * quantity
  end

  def order_total
    @order.total
  end

  def place_order(confirmation)
    raise "Incorrect total entered, please try again" if confirmation != order_total
    order.summary
    order.sms_confirmation
  end
end
