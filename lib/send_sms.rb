require 'twilio-ruby'

account_sid = "AC0e62c5cd621195d685436c46aee8aef1" # Your Account SID from www.twilio.com/console
auth_token = "5a1398d391f73861c1ff7d6cf61ac3a3"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447827323206",    # Replace with your phone number
    from: "+442382146646")  # Replace with your Twilio number
