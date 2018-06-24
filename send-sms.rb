require("twilio-ruby")

account_sid = "AC5a0200df476dbc0d381fc379f1c681c8"
# Your Account SID from www.twilio.com/console
auth_token = "5842738d38fcd4de82034cd78dc2079b"
# Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before 18:52",
    to: "+447428526497", # Replace with your phone number
    from: "+447481362122 ") # Replace with your Twilio number

puts message.sid
