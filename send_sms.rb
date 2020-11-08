require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)


from = '++447380336687' # Your Twilio number
to = '+447853044776' # Your mobile phone number

@client.messages.create(
from: from,
to: to,
body: "Hey BB!"
)
