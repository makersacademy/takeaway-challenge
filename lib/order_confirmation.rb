require 'dotenv'
Dotenv.load
require 'rubygems'
require 'twilio-ruby'

class OrderConfirmation

  def initialize(twilio_client_class=Twilio::REST::Client)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = twilio_client_class.new(account_sid, auth_token)
  end

  def send_sms(message)
    from = ENV['TWILIO_NUMBER']
    to = ENV['MY_NUMBER']
    body = message

    @client.account.messages.create(
      to: to,
      from: from,
      body: body
    )
  end
end
