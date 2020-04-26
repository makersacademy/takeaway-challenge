require './lib/order.rb'
require './lib/menu.rb'
require 'twilio-ruby'

class Bill
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def pay
    puts "You've paid #{order.current_total}"
  end

  def confirmation
    account_sid = ENV['SID']
    auth_token = ENV['AUTH']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['SENDER']
    to = ENV['RECEIVER']

    client.messages.create(
      from: from,
      to: to,
      body: "Your order has been accepted!"
    )
  end
end
