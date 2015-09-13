require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC026c389d6b0a20333d6712e34a7b411c'
auth_token = 'd191ca1537cbd577f5d4e91d75fa04e3'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
	:from => '+441158242702',
	:to => '+447841630217',
	:body => 'Harry',
})
