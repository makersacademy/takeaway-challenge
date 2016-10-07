require 'twilio-ruby'

account_sid = 'AC6e70d6dcc83c097a6e913c3afbd424a3'
auth_token = '901c21df552c5cfcf478c47b4aa310e3'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+441493202211',
  to: '+447759548193',
  body: 'Thank you! Your order was placed and will be delivered before #{to do}.' #to replace with correct time
)
