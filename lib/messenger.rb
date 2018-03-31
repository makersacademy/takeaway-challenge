require 'twilio-ruby'

account_sid = "ACCOUNT SID" # Your Account SID from www.twilio.com/console
auth_token = "AUTH TOKEN"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447568538812",    # Replace with your phone number
    from: "+441618506949")  # Replace with your Twilio number

puts message.sid

