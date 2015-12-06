# Set up
require 'twilio-ruby'
@account_sid = 'AC4c0b4131495b6b9e2d9eae345fe4d986'
@auth_token = '1c6f162056679a97d9d690a164a2d866'

# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)



# send an sms
@account.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)


@client.account.messages.create({
	:from => '+441915801985',
})
