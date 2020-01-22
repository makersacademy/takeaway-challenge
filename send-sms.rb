require("bundler")
Bundler.require()

account_sid = 'AC95ce3cd8f6b05ca7c3ad0be95882c2c9'
auth_token = 'b9ada2b73535d110b063116f4a47bd5b'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.messages.create(
  from: '+13173761339',
  to: '+447519283210',
  body: 'Thank you! Your order was placed and will be delivered before 3:55'
)
