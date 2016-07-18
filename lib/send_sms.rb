# =begin
require 'dotenv'
require 'twilio-ruby'

Dotenv.load


module Send_sms
# put your own credentials here
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+12566494395',
  to: ENV['MY_MOB'],
  body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60*2).strftime("%k:%M")}"
)
end

# =end
