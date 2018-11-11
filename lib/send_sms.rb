# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Message
  def initialize
    @time = Time.new
    @account_sid = 'AC83ceb2dbca3efdd4e5b7e0694eeb70cb'
    @auth_token = '48a77764ee0d2450c2d67a28f4131911'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

def send_message
    @client.messages.create(
    from: '+441704320460', # Your Twilio number
    to: '+447481966038.', # Your mobile phone number
    body: "Thank you! Your order was placed and will be delivered before #{@time + 3600}"
    )
  end

end
