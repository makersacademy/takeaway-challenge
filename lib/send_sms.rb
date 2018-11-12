# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Message
  def initialize
    @time = Time.new
    @account_sid = ''
    @auth_token = ''
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

def send_message
    @client.messages.create(
    from: '+', # Your Twilio number
    to: '+', # Your mobile phone number
    body: "Thank you! Your order was placed and will be delivered before #{@time + 3600}"
    )
  end

end
