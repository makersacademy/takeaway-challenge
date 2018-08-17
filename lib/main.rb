require 'twilio-ruby'
require 'dotenv/load'

# put your own credentials here
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
twilio_phone = ENV['TWILIO_PHONE_NUMBER']
customer_phone = ENV['CUSTOMER_PHONE_NUMBER']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
  from: twilio_phone,
  to: customer_phone,
  body: 'Hey there! This is working :)'
)
