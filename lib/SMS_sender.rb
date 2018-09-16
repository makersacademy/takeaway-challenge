require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC76ffde892450c4c91829fbb047934164'
auth_token = 'c99c7f6428e12e25a3ffb94c20af10ba'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
from: '+441323700347',
to: '+447804389726',
body: 'Hey there!'
)
