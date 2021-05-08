# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SendSMS
  def initialize
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = ENV['TWILIO_NUM'] # My Twilio number
    @to = ENV['MOB_NUM'] # Verified number that my Twilio account can send to
  end
  
  def send(to, body)
    @client.messages.create(
    from: @from,
    to: to,
    body: body
    )
  end
end
