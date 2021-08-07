require 'twilio-ruby'
require "dotenv"
Dotenv.load('.env')

class Mesagger

  def initialize(message)
    account_sid = ENV["TWILIO_APP_SID"]
    auth_token = ENV["TWILIO_APP_KEY"]
    @from = ENV["TWILIO_PHONE_FROM"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(message, to = ENV["TWILIO_PHONE_TO"])
    message = @client.messages.create(
      body: message,
      to: , to
      from: @from)
  end

end
# puts message.sid