# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC15c6d0701dbc05e0401396cc888be2a5'
auth_token = '349e20a236746ca5052247daed4897b7'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447480639157' # Your Twilio number
to = '+447821023816' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "We received your order and it will be dispatched shortly"
)
