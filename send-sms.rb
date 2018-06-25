require("twilio-ruby")


account_sid = ENV['TWILIO_ACCOUNT_SID']
# Your Account SID from www.twilio.com/console
auth_token = ENV['TWILIO_AUTH_TOKEN']
# Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before 18:52",
    to: ENV['MY_PHONE_NUMBER'], # Replace with your phone number
    from: ENV['TWILIO_PHONE_NUMBER']) # Replace with your Twilio number

puts message.sid
