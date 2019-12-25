require 'twilio-ruby'
require 'dotenv'
Dotenv.load('sensitive.env')

class SendSMS

  def initialize(sid, token, outbound, inbound)
    account_sid = sid 
    auth_token = token
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = outbound # Your Twilio number
    @to = inbound # Your mobile phone number
  end

  def send(body)
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Your order is confirmed! It will arrive by #{Time.now + 3600}. Order: #{body}"
    )
  end
end
