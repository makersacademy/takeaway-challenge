require 'twilio-ruby'

account_sid = "AC6eed781cf5d61ff547d3b56685fce6b3"
# Your Account SID from www.twilio.com/console
auth_token = "accdb2114f4e3151da0b86099d818763
"
# Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447711896812",    # Replace with your phone number
    from: "+441304410190")  # Replace with your Twilio number

puts message.sid
