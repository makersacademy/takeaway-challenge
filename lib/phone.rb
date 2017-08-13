require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACaea30446288b9ec7ed8abf8fcff00f34'
auth_token = 'ffe1130efabcb0fb3f0b1d536a1dbfc5'
order = "Loads of foods"

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create({
  from: '+441412800754',
  to: '+447450947387',
  body: order
})
