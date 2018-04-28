require 'twilio-ruby'

account_sid = 'ACace3793f369b745605c73555f0078ab8'
auth_token = '25ff44bd7497acbb6412c927c9b8c4f8'

@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.messages.create(
                              body: "Hello, test message",
                              to: "+445555555555",
                              from: "+15005550006"
)

puts message.sid
