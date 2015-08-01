require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACa5ef8ead3ef15b82f3e25c23c9504fa5'
auth_token = 'b8c8ffa5636d5b69488e8a210dc3a1f2'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+441695302059',
  :to => '+4407572437603',
  :body => 'Hello Lewis',
})