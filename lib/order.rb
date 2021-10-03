require 'twilio-ruby'
require 'dotenv/load'

class Order
  
  attr_reader :orders, :menu
  
  def initialize
    @orders = []
  end

  # def display_order
  # end

  # def finish_order
  # end

  def order_confirmation
    delivery_time
    puts "Thanks for your order! It will be delivered in around 45 minutes at approximately #{ @time.strftime("%H:%M") }."
    # send_sms
  end

  def delivery_time
    @time = Time.new + 45*60
  end
  
  # def send_sms

  # # don't hard code my keys
  # # don't push credentials to GitHub
  # # set the auth token as an environmental variable and reference the variable from your code

  # account_sid = ENV["TWILIO_ACCOUNT_SID"]
  # auth_token = ENV["TWILIO_AUTH_TOKEN"]
  # @client = Twilio::REST::Client.new account_sid, auth_token

  # message = @client.messages.create(
  #   body: "Thanks for your order! It will be delivered in around 45 minutes at approximately #{ @time.strftime("%H:%M") }.",
  #   to: ENV["MY_PHONE_NUMBER"],
  #   from: ENV["TWILIO_MAGIC_NUMBER"])
  # end

end
