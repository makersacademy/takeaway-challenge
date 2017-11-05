require 'twilio-ruby'

account_sid = "ACd197df15a6b5c29e53d7a9778ffbbf93" # Your Account SID from www.twilio.com/console
auth_token = "fd245a65de57e661a6ab36944b0696c8"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before 18:52",
    to: "+447445000521",    # Replace with your phone number
    from: "+441173259862")  # Replace with your Twilio number

puts message.sid
