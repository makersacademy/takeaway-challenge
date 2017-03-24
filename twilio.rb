require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC6612e0baf00f044822ca233dcccb24b6'
auth_token = 'ad10c6c767e5ff7b3d501e41f21fd607'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

#Your new Phone Number is +441530382009

@client.messages.create(
  from: '+441530382009',
  to: '+447710669803',
  body: 'Cats are ace!'
)
