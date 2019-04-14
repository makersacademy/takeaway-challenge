require 'twilio-ruby'

account_sid = ENV["ACCOUNT_SID"]
auth_token = ENV["AUTH_TOKEN"]

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
  body: "Hello from Carly, twilio is now working",
  to: ENV["TO"],
  from: ENV["FROM"]
)

puts message.sid
