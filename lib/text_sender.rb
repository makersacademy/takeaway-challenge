
require 'twilio-ruby'
require 'dotenv/load'

class TextSender

  def initialize
    @account_sid = ENV['TWILIO_ACC_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

  def send(message = "a text")
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.api.account.messages.create(
      from: ENV['TWILIO_FROM_NUMBER'],
      to: ENV['TWILIO_TO_NUMBER'],
      body: message
    )
    true
  end
end
