# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure

class Checkout
  def initialize(_client = Twilio::REST::Client, _sid = ENV['account_sid'], _auth = ENV['auth_token'])
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end 

  def message 
    time = (Time.new + 10 * 60).strftime("%I:%M%p")
    body = "Thank you! Your order was placed and will be delivered before #{time}"
    message = @client.messages
      .create(
        body: body,
        from: '+16308127552',
        to: '+447729415402'
      )
  end 
end
