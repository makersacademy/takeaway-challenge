require 'twilio-ruby'
require 'dotenv/load'

class Order
  
  attr_reader :orders, :menu
  
  def initialize
    @orders = []
  end

  def order_confirmation
    delivery_time
    puts "Thanks for your order! It will be delivered in 45 minutes at #{@time.strftime("%H:%M")}."
    send_sms
  end

  def delivery_time
    @time = Time.new + 45 * 60
  end
  
  def send_sms
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.messages.create(
      body: "Thanks for your order! It will be delivered in 45 minutes at #{@time.strftime("%H:%M")}.",
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_MAGIC_NUMBER"])
  end

end
