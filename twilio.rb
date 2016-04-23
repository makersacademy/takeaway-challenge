# not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC0e6210c044bf9e6226bd38e38552d812'
auth_token = 'c5fc6662e7564163f94e5ebe15e0d79c'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
	:from => '+441484906105',
	:to => '',
	:body => '',
	# :media_url => 'http:adas',
	# :status_callback => 'aasda'
})
