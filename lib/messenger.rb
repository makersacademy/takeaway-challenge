require "rubygems"
require "twilio-ruby"
require "dotenv"
Dotenv.load

class Messenger
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @from_phone = ENV["TWILIO_PHONE"]
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send(message, phone = ENV['TWILIO_DESTINATION_PHONE'])
    @client.account.messages.create(
    from: @from_phone,
    to: phone,
    body: message
    )
  end
end
