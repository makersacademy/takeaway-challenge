require 'twilio-ruby'
require 'dotenv/load'


class Messenger
  def initialize(twilio_class = nil)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = twilio_class.new ||= Twilio::REST::Client.new account_sid, auth_token
  end
  def send_message(message)
    @client.api.account.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['MY_PHONE_NUMBER'],
      body: message
    )
  end


end