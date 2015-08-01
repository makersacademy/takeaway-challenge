require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACd18bfc872e98296bfd513c3537d79945'
auth_token = 'bb86f5ef30b2e093ec06255279f7ece8'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+441698313072',
  :to => '+447763214986',
  :body => 'Hey! I should be on time today as I just sent you this text from my app!!!! Will text when I\'m leaving :) '
  })