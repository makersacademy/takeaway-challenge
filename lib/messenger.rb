require 'twilio-ruby'
require 'dotenv/load'

class Messenger
  def initialize(twilio = nil)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = twilio ||= Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(message)
    @client.api.account.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['MY_PHONE_NUMBER'],
      body: message
    ) unless ENV['TWILIO_ENABLED'] == '0'
  end

end
