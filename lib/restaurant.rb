require 'twilio-ruby'

class Restaurant
  attr_accessor :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def view_menu
    @menu.prettify_menu_list
  end

  def view_basket
    @order.basket.each { |item| p item }
  end

  def place_order(meal, quantity = 1)
    @order.order(meal, quantity)
  end

  def confirm_order(amount)
    @order.pay(amount)
    sms_confirmation
  end

  def sms_confirmation
    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE_NUMBER"],
      body: "Thank you! Your order has been placed and will arrive at approximately #{(Time.now + 1800).strftime("%k:%M")}."
    )
  end
end
