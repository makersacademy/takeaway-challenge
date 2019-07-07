require 'twilio-ruby'

account_sid = "AC3dacdc49158a31763601f3cd87e88f48" # Your Account SID from www.twilio.com/console
auth_token = "14a1891177aba79770d237c22e57b4de"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447879633386",    # Replace with your phone number
    from: "+441543624317")  # Replace with your Twilio number

puts message.sid
