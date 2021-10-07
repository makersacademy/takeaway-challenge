require 'twilio-ruby'
require 'dotenv/load'

class Order
  
  attr_reader :orders, :menu
  
  def initialize
    @orders = []
  end

  def order_confirmation
    delivery_time
    puts "Thanks for your order! It will be delivered in 45 minutes at #{@delivery_time}."
    send_sms
  end 

  private

  def delivery_time
    @delivery_time = (Time.new + 45 * 60).strftime("%H:%M")
  end
  
  def send_sms
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.messages.create(
      body: "Thanks for your order! It will be delivered in 45 minutes at #{@delivery_time}.",
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_MAGIC_NUMBER"])
  end

end
