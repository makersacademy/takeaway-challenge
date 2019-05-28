require "dotenv/load"
# Download the helper library from https://www.twilio.com/docs/ruby/install
require "rubygems"
require "twilio-ruby"
require "time"

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure

class Message
  def initialize
  account_sid = ENV["TWILIO_ACCOUNT_SID"]
  auth_token = ENV["TWILIO_AUTH_TOKEN"]
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  end
  def send
  message = @client.messages.create(
    from: ENV['MY_TWILIO'],
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 1 * 60 * 60).strftime("%H:%M")}",
    to: ENV['MY_NUMBER']
  )
  puts message.sid
  end
end
