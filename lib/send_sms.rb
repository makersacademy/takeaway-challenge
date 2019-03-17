require 'twilio-ruby'
require 'dotenv/load'

class Sms
  def initialize(to = ENV['TWILIO_TO_NUMBER'], from = ENV['TWILIO_FROM_NUMBER'])
    @to = to
    @from = from
  end
  
  def send(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    client.messages.create(
    from: @from,
    to: @to,
    body: message
    )
  end
end
