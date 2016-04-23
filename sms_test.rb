require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC412bbc135865f0af2e2c2968f8b3cb54'
auth_token = '33ed993e5ba200da8628e65ab2f245ed'

from = '+441277424311'
to = 'removing no until i work out how to hide it'
body = 'IT WORKS!'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => from,
  :to => to,
  :body => body,
})
