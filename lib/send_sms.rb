# # Download the helper library from https://www.twilio.com/docs/ruby/install
# require 'rubygems'
# require 'twilio-ruby'
#
# # Your Account Sid and Auth Token from twilio.com/console
# # DANGER! This is insecure. See http://twil.io/secure
# account_sid = 'xxxxxx'
# auth_token = 'xxxxxx
# @client = Twilio::REST::Client.new(account_sid, auth_token)
#
# message = @client.messages
#   .create(
#      body: "Thank you! Your order will be delivered before 19.58",
#      from: 'xxxxx',
#      to: 'xxxxx'
#    )
#
# puts message.sid
