require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC4de8dd33e2d6ee76b3faf33cb63def35'
auth_token = '53e0790c0c05a41fdfb74f288bcb9476'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
	from: '+441274451660',
	to: '+447960022719',
	body: 'good morning rebecca',
)
