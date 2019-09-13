# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SendSMS

account_sid = 'ACb6b155c1976035cc0c7e5ac9cc47d346'
auth_token = 'a613e543ad47c45ef1f40114e5729466'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441290211692' # Your Twilio number
to = '+447917612341' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{Time.now + 60 * 60}"
)

end
