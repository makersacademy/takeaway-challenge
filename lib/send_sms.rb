require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACd0d0e5cddebd43e42a64a2492a66c2e3'
auth_token = '605656de1ad56cda8fa095192b5dfeb0'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+441723282061',
  :to => '07764740151',
  :body => 'test',
})