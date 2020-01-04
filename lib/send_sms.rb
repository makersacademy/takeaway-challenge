# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SendSMS

  def initialize
    account_sid = 'AC8f234f862eb9578dd8dae76f7e1fe812'
    auth_token = 'fbba83efd122508852969f5dcf6adea2'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = '+447400058924' # Your Twilio number
    @to = '+447810026218' # Your mobile phone number
  end

  def send(total)
    @client.messages.create(
    @from: from,
    @to: to,
    body: "Your order will arrive by #{Time.now + 3600} costing £#{total}"
    )
  end
end
