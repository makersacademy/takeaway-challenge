require 'twilio-ruby'

account_sid = 'AC1e69da5fbb6d18ff5ab740746eebfca1'
auth_token = '7edb648e3ad6ecdcd464575c89e54e95'

@client = Twilio::REST::Client.new account_sid, auth_token

# @client.messages.create(
#   from: '+14159341234',
#   to: '+16105557069',
#   body: 'Hey there!'
# )
