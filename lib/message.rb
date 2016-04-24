require 'dotenv'
Dotenv.load

require 'twilio-ruby'

class Message
  attr_reader :client

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(price, t)
    msg = "Thank you! Your order was placed and will "\
      "be delivered at #{t} for £#{price}. \n \n Thanks for your order!"
    twilio_send(msg)
    msg
  end

  def twilio_send(msg)
    @client.messages.create(
      from: ENV["TWILIO_FROM_PHONE_NUMBER"],
      to: ENV["TWILIO_TO_PHONE_NUMBER"],
      body: msg
    )
  end
end