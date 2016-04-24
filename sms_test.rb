require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC412bbc135865f0af2e2c2968f8b3cb54'
auth_token = '33ed993e5ba200da8628e65ab2f245ed'

from = '+441277424311'
to = ENV["PHONE_NUMBER"]
body = 'IT WORKS! youofod will arrive at #{time stamp when order was made + 1 hour}'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => from,
  :to => to,
  :body => body,
})
