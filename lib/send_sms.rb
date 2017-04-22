require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC09df84fe1d2a8ea043d55ac93dc90fc5'
auth_token = 'c897fa5455b04e8979a5ae59cd6eeddc'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+441626572068',
  to: '+447711997652',
  body: 'Robot invasion! Reply back with any sightings.'
)
