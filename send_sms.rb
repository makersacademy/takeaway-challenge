# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'dotenv/load'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19035013515' # My Twilio number
to = '+447929875411' # My mobile phone number

client.messages.create(
from: from,
to: to,
body: 'Hungry Man! Thanks so much for your order its on its way!'
)
