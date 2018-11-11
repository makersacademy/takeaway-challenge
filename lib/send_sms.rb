# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Message
  def initialize
    @time = Time.new
  end

def send_message
    account_sid = 'ACe5209ee898825748a9d059fe4c66114c'
    auth_token = 'bfa1598c7abd450b7111d75fae995498'
    client = Twilio::REST::Client.new(account_sid, auth_token)


    client.messages.create(
    from: '+441964775303', # Your Twilio number
    to: '+447481966038.', # Your mobile phone number
    body: "Thank you! Your order was placed and will be delivered before #{@time + 3600}"
    )
  end

end
