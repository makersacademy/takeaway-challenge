require 'twilio-ruby'
@account_sid, @auth_token = 'account_sid', 'auth_token'
# logs in
@client = Twilio::REST::Client.new @account_sid, @auth_token

message = @client.messages.create(
  body: "Thank you!",
  to: "+phone number",# phone number
  from: "+12563877057")# use this number for sms
puts message.sid
