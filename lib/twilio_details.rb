require 'twilio-ruby'
require 'dotenv/load'

# put your own credentials here
account_sid = DOTENV['TWILIO_ID']
auth_token = DOTENV['TWILIO_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
