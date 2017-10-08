require 'rubygems'
require 'twilio-ruby'

account_sid = AC5eceb31c66b1665714738a0fa1ec0301
auth_token = 52e5ffba3487fd969503747c4ec1d6c0

@client = Twilio::REST::Client.account_sid, auth_token

@client.account.messages.create({
  :from => ,
  :to => 07841642471,
  :body => "Thank you! Your order was placed and will be delivered before 18:52"
  :media_url =>

  })
