require 'twilio-ruby'
require 'passw'

# put your own credentials here
account_sid = Account_sid
auth_token = Account_token

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
