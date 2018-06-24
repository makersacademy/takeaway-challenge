require 'twilio-ruby'

account_sid = "AC7e39b6b96a12214456b2217c17792dd7" # Your Account SID from www.twilio.com/console
auth_token = "7e454a37dd32ab9f8d6b764984900dd2"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447956874881",    # Replace with your phone number
    from: "+447481361728")  # Replace with your Twilio number

puts message.sid
