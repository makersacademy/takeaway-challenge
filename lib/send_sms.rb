# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SendSMS

account_sid = 'AC511926ac6185fcacbb9bd18aa8c8b437'
auth_token = '230f491d403a28d6a7c7211e92b87c9f'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+18636243017' # Your Twilio number
to = '+447432705228' # Your mobile phone number

message = client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before 18:52"
)

end