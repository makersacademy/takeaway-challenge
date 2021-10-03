require 'twilio-ruby'
require 'dotenv/load'

class Twilio

def initialize
  @account_sid = ENV["TWILIO_ACCOUNT_SID"]
  @auth_token = ENV["TWILIO_AUTH_TOKEN"]
  @client = Twilio::REST::Client.new @account_sid, @auth_token
end

def send_sms
  delivery_time
  message = @client.messages.create(
  body: "Thanks for your order! It will be delivered at approximately #{ @time.strftime("%H:%M") }.",
  to: ENV["MY_PHONE_NUMBER"],
  from: ENV["TWILIO_MAGIC_NUMBER"])
end

end