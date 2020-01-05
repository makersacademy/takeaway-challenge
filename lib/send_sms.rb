# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'dotenv'
Dotenv.load('./.env')

class SendSMS
  def initialize(account_sid = ENV['twilio_account_sid'], 
    auth_token = ENV['twilio_auth_token'], 
    from = ENV['twilio_from'], to = ENV['twilio_to'])
    
    @account_sid = account_sid
    @auth_token = auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = from
    @to = to
  end

  def send(total)
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Your order will arrive by #{Time.now + 3600} costing £#{total}"
    )
  end
end
