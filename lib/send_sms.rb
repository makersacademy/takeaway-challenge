require 'bundler'
require 'dotenv'
Dotenv.load('~/Documents/Makers/Ruby/takeaway-challenge/.env')
Bundler.require()
require 'time'

class Message
  def initialize(time = Time.now)
    @time = time
  end

  def send_text
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      to: ENV["PHONE_NUMBER"],
      from: "+447723431770",
      body: text_message
    )
  end

  def order_time
    "#{@time.hour + 1}:#{@time.min}"
  end

  def text_message
    "Thank you! Your order was placed and will be delivered before #{order_time}"
  end
end
