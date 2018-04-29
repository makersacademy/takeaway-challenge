require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.messages.create(
                              body: "Hello, test message",
                              to: "+445555555555",
                              from: "+15005550006"
)

puts message.sid
