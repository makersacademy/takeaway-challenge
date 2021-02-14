require 'twilio-ruby'
require 'sinatra'

account_sid = ACCOUNT_SID 
auth_token = AUTH_TOKEN 

# set up a client to talk to the Twilio REST API
@clinet = Twilio::REST::Client.new account_sid, auth_token

