# not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'xxx'
auth_token = 'xxx'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
	:from => 'xxx',
	:to => '',
	:body => '',
	# :media_url => 'http:adas',
	# :status_callback => 'aasda'
})
