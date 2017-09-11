require 'twilio-ruby'

account_sid = "AC0de1208f7ea73d489b41ecda8c5ed54f" # Your Account SID from www.twilio.com/console
auth_token = "55fba7009608465f493b4395eb00c633"

#
@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447950837028",    # Replace with your phone number
    from: "+441902504480")  # Replace with your Twilio number

puts message.sid

# require 'twilio-ruby'
#
# account_sid = "AC9fd118c650e4e4802a5657c0e7d50c37" # Your Account SID from www.twilio.com/console
# auth_token = "0cf763cbfeb7b95f0175323e7d66059d"   # Your Auth Token from www.twilio.com/console
#
# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "Hello from Ruby",
#     to: "+447970205912",    # Replace with your phone number
#     from: "+441202835053")  # Replace with your Twilio number
#
# puts message.sid
