require 'twilio-ruby'
require 'dotenv'

class Sms
  attr_reader :credentials

  def initialize
    @credentials = Dotenv.load
    @client = twilio_client

  end

  def send(message, number)
    @client.messages.create(
     from: credentials["TWILIO_NUMBER"],
     to: credentials["TWILIO_MOBILE"],
     body: message
     )
  end

  private

  def twilio_client
    account_sid = credentials["TWILIO_ACCOUNT_SID"]
    auth_token = credentials["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
