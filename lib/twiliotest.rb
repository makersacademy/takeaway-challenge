require 'twilio-ruby'

account_sid = "AC9132f72c39521dc8c32c732807df6236" # Your Test Account SID from www.twilio.com/console/settings
auth_token = "f62a99a685c4bef44d342be3e6a96876"   # Your Test Auth Token from www.twilio.com/console/settings

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447565608571",    # Replace with your phone number
    from: "+1 812 496 5686")  # Use this Magic Number for creating SMS
puts message.sid