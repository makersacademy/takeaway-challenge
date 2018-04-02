require 'twilio-ruby'

account_sid = "AC731f0e00d3cf515a57115e532f2afdcb" # Your Account SID from www.twilio.com/console
auth_token = "dca57d041a6ac2d90a99d4ced265903"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447849348874",    # Replace with your phone number
    from: "+441392690299")  # Replace with your Twilio number

puts message.sid
