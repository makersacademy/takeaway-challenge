# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Message

  def initialize
    @account_sid = 'ACa6109d99dbd12ca074bcf644718b0b6d'
    @auth_token = '3cb9659b958c911aaf630ccac122a28e'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @from = '+441424531192' # Your Twilio number
    @to = '+447799537436' # Your mobile phone number
  end
  
  def send(body = "body empty")
    @client.messages.create(
    from: @from,
    to: @to,
    body: body)  
  end
end
