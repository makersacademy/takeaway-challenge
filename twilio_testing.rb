# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACd1e035e18219b4a2e47ed7c7e7e69deb'
auth_token = '545218b0ed924b407b11ca2d0aa0781c'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.account.messages.create({
    :to => '+447515434017',
    :from => '+441667502018',
    :body => 'Hi this is a test.',
})
puts "text sent"
