=begin
require 'twilio-ruby'
module Send_sms
# put your own credentials here
account_sid = 'AC12576d9d4444042d6f5bc1d8b3075ada'
auth_token = 'e312e0de7ef6b7eb933dc78c3329122b'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+12566494395',
  to: '+373078103585',
  body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60*2).strftime("%k:%M")}"
)
end

=end
