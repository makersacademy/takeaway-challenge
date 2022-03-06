require_relative 'order'
require 'time'
require 'rubygems'
require 'twilio-ruby'

class Delivery

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def confirmation(order)
   raise "Order pending!" if order.order_status == "pending"
    time = Time.now
    time += (60 * 60)

    message = @client.messages
    .create(
       body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%k:%M")}",
       from: '+17652565176',
       to: ENV['GAYA_MOBILE']
     )
    puts message.sid
  end
end