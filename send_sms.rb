# require 'twilio-ruby'
#
# account_sid = "" # Your Account SID from www.twilio.com/console
# auth_token = "{{  }}"   # Your Auth Token from www.twilio.com/console
#
# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.account.messages.create(:body => "Hello from Ruby",
#   :to => "+", # Replace with your phone number
#   :from => "+4")    # Replace with your Twilio number
#
# puts message.sid


require 'twilio-ruby'

# put your own credentials here
account_sid = ''
auth_token = ''

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+',
  to: '+',
  body: 'Robot invasion! Reply back with any sightings.'
)
