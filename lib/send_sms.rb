require 'twilio-ruby'

class Message

  def send_sms

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = 'xxxxxxx'
auth_token = 'xxxxxx'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: "Thank you! Your order will be delivered before 19.58",
     from: 'xxxxxxx',
     to: 'xxxxxxxx'
   )
  end
end
