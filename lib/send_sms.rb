# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC9ee797f872d5f4d45dee0a56e6ee7f55'
auth_token = '9e172ea70287c160dd83c97f73d7bcdf'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+441227641124',
  :to => '+447599997271',
  :body => "Thank you! Your order was placed and will be delivered before 18:52", #include the time class for arrival one hour after order
  # :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg',
})
