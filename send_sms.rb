require 'twilio-ruby'
require_relative './lib/user_session'
require 'twilio-config'

ACCOUNT_SID = ENV[ACCOUNT_SID]
AUTH_TOKEN = ENV[AUTH_TOKEN]
NUMBER = ENV[NUMBER]
client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

from = '+441375352703' # Your Twilio number
to = NUMBER # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%k:%M")}"
)