require_relative './order.rb'
require_relative './menu.rb'
require_relative './sms.rb'
require 'envyable'
Envyable.load('config/env.yml')

class TakeAway
  attr_reader :menu, :curr_order, :payment, :delivery_eta

  def initialize(order = Order, menu = Menu, sms = SMS)
    @order = order
    @menu = menu.new
    @sms = sms
    @payment = 0
  end

  def show_menu
    p @menu.list
  end

  def start_order
    @curr_order = @order.new
  end

  def complete_order(amount)
    customer_payment(amount)
    send_confirmation
  end

  def send_confirmation
    @delivery_eta = Time.now + 1 * 60 * 60
    @new_sms = @sms.new
    default_msg = "Thank you! Your order was placed and will be delivered before #{@delivery_eta.strftime('%H:%M')}"
    @new_sms.send_sms(default_msg)
  end

  private

  def customer_payment(amount)
    raise StandardError.new("You have not paid the correct total amount") if amount != @curr_order.total.round(2)
    p "Payment successful! You will shortly receive a confirmation text."
  end

end
