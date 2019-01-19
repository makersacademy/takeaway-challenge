require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Text
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end
  
  def send(message)
    @client.messages.create({
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['MOBILE'],
      body: message
    })
  end
end
