require_relative 'menu'
require_relative 'order'
require 'rubygems'
require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :order, :order_time

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    menu.show
  end

  def place_order(item, quantity = 1)
    return 'This item is not available' unless available?(item)
    order.add(item, quantity)
  end

  def show_order
    order.overview
  end

  def checkout_order(price = 0)
    order.checkout(price)
    @order_time = Time.now + 3600
    send_sms(number)
  end

  def reset_order
    order.reset
  end

  def available?(item)
    menu.listed?(item)
  end

  private

  TWILIO_NUMBER = '+44 1442 796246'

  def send_sms(number)
  account_sid = 'AC6c3b2f378924f8f5ff1587863865e8a6'
  auth_token = '518f76c2b5b9533333af831e1a98baef'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
	:from => '+441442796246',
	:to => 'number',
	:body => "Thank you for your order!! Your order will be delivered at #{order_time}",
  })
  end

end
