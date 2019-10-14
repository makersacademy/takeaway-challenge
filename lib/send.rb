require 'twilio-ruby'
@account_sid, @auth_token = 'AC94392cc1d5ae8e5f01f162d5c6bc0a29', '0e563372bfd9ec7e38f315e0b77ae2f4'
# logs in
@client = Twilio::REST::Client.new @account_sid, @auth_token

message = @client.messages.create(
  body: "Thank you!",
  to: "+phone number",# phone number
  from: "+12563877057")# use this number for sms
puts message.sid
