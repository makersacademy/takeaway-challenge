require 'twilio-ruby'
require 'envyable'
Envyable.load('config/env.yml')

class Messenger

  def initialize
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(message)
    @client.messages.create(
    from: ENV["TWILIO_NUMBER"],
    to: ENV["CUSTOMER_NUMBER"],
    body: message)
  end
end
