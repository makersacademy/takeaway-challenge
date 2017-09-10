require_relative 'order'
require_relative 'menu'
require 'twilio-ruby'


class Takeaway
  attr_reader :order, :menu

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def add_to_list(food, price)
    @order.add(food, price)
  end

  def confirmation_text
    account_sid = "" # Account SID from www.twilio.com/console
    auth_token = ""   # Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Order confirmation",
    to: "+12345678901",    # Replace with phone number
    from: "+12345678901")  # Replace with Twilio number
  end
end
