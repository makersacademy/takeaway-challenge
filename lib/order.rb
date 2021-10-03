require 'twilio-ruby'
require 'dotenv/load'

class Order
  
  attr_reader :order
  
  def initialize
    @order = []
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def display_order
  end

  def finish_order
  end

  def order_confirmation
    delivery_time
    puts "Thanks for your order! It will be delivered at approximately #{ @time.strftime("%H:%M") }."
    send_sms
  end

  def delivery_time
    @time = Time.new + 45*60
  end

  def send_sms
    delivery_time
    message = @client.messages.create(
    body: "Thanks for your order! It will be delivered at approximately #{ @time.strftime("%H:%M") }.",
    to: ENV["MY_PHONE_NUMBER"],
    from: ENV["TWILIO_MAGIC_NUMBER"])
  end

end
