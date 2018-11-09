require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC86f4173815152b92a5385404637864b7'
auth_token = 'b19b3067800cd267a907052019fd0367'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token


@client.api.account.messages.create(
  from: '+14159341234',
  to: '+447880151641',
  body: 'Hey there!'
)
