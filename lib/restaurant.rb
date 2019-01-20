require 'twilio-ruby'

account_sid = "AC0349e1809352be820a6c77ae506d5f84" # Your Account SID from www.twilio.com/console
auth_token = "c53285967bdfd523b91ca59acc5350c4" # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447763570468",    # Replace with your phone number
    from: "+447449455805")  # Replace with your Twilio number

puts message.sid
