require 'twilio-ruby'
require "dotenv"
Dotenv.load('.env')

class Messager

  def initialize
    account_sid = ENV["TWILIO_APP_SID"]
    auth_token = ENV["TWILIO_APP_KEY"]
    @from = ENV["TWILIO_PHONE_FROM"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(message, to = ENV["TWILIO_PHONE_TO"])
    sent = @client.messages.create(
      body: message,
      to: to,
      from: @from)
    sent.sid.nil? ? false : true
  end

end
