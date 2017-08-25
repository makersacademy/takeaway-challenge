require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
# put your own credentials here
account_sid = 'AC297b79f096953ffb25e6c7a7554798b9'
auth_token = 'c3fce4179277f9e78c5c5897cb1448aa'
# set up a client to talk to the Twilio REST API

@client = Twilio::REST::Client.new account_sid, auth_token
@client.api.account.messages.create({
  :from => '+441158246050',
  :to => '+447815793407',
  :body => 'Thank you! Your order was placed and will be delivered before 18:52',
  # :media_url => 'https://climacons.herokuapp.com/clear.png'
})
