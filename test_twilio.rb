require 'twilio-ruby'

account_sid = "AC66383f8637b98199adab167d20c3e9d6" # Your Account SID from www.twilio.com/console
auth_token = "15f254f8e0e2df38f7ec00e759eb63f3"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: ".

    Big Steve here,
    I know things didn't work out with you and Mercedes but I wanted to let you know that I've got a new option that I think you'd be very interested in...",
    to: "+447732911013",    # Replace with your phone number
    from: "+441598272011")  # Replace with your Twilio number

puts message.sid
