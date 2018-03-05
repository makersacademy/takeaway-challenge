require 'twilio-ruby'

account_sid = "ACc6f40f795f5e616eddbe67ee2ae9f1b0" # Your Account SID from www.twilio.com/console
auth_token = "65c7256479d56fba835e10c719de806d"   # Your Auth Token from www.twilio.com/console
time = Time.new

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.strftime("%M")}",
    to: "+447534057767",    # Replace with your phone number
    from: "+447480619321")  # Replace with your Twilio number

puts message.sid
