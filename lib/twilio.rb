require './config.rb'
require 'twilio-ruby'

# put your own credentials here
account_sid = Config::ACCOUNT_SID
auth_token = Config::AUTH_TOKEN

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
  from: Config::TWILIO_NUMBER,
  to: Config::MY_NUMBER,
  body: Config::MESSAGE
)
