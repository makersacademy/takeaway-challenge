require_relative 'menu'
require_relative 'order'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class Takeaway

  attr_reader :menu, :order, :order_time, :client_number, :twilio_number

  Dotenv.load

  def initialize(order=Order.new, menu=Menu.new)
    @menu = menu
    @order = order
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client_number = ENV["CLIENT_NUMBER"]
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
    send_sms(client_number)
  end

  def reset_order
    order.reset
  end

  def available?(item)
    menu.listed?(item)
  end

  private

  def send_sms(client_number)

  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV["AUTH_TOKEN"]

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
	from: twilio_number,
	to: client_number,
	body: "Thank you for your order!! Your order will be delivered at
  #{order_time}",
  })
  end

end
