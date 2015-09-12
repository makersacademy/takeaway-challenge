require 'twilio-ruby'

# put your own credentials here, get them at twilio.com
account_sid = 'AC279fc8810e702c33e972ad9178c3ebab'
auth_token = '0d95e1d8b7485eef12abc805049b8d3c'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.messages.create(
  from: '441496877050',
  to: '+447590425818',
  body: 'This was sent from my computer!!!'
)
