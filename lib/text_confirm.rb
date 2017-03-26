require 'sinatra'
require 'twilio-ruby'


# put your own credentials here
account_sid = 'AC815e0d7ef5479712c28275f88f53e384'
auth_token = 'ad80a4f356e4751022a73297b6945b62'

# SET-UP
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# SEND AN SMS
@client.messages.create(
  from: '+441290211691',
  to: '+447702088211',
  body: 'Thank you! Your order was placed and will be delivered before 18:52. Probably.'
)


# # alternatively, you can preconfigure the client like so
# Twilio.configure do |config|
#   config.account_sid = account_sid
#   config.auth_token = auth_token
# end
#
# # and then you can create a new client without parameters
# @client = Twilio::REST::Client.new
