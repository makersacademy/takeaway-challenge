require 'twilio-ruby'

account_sid = "AC2c0d89c293de7dbd5d8f3b59c8264255" # Your Account SID from www.twilio.com/console
auth_token = "2b7ec643407fcf0f0ab6b7e3420472f5"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before 18:52",
    to: "+447782199162",    # Replace with your phone number
    from: "+447480609264")  # Replace with your Twilio number

puts message.sid
