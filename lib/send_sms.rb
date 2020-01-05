require 'dotenv/load'
require 'twilio-ruby'


class SendSMS
  def initialize 
    account_sid = ENV['twilio_account_sid']
    auth_token = ENV['twilio_auth_token']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV['from']
    @to = ENV['to']
  end

  def send(message)
    @client.messages.create(
    from: @from,
    to: @to,
    body: message
    )
  end
end
