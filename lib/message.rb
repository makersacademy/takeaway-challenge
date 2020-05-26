# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
class Message

  def sender
  end
=begin
 Your Account Sid and Auth Token from twilio.com/console
 DANGER! This is insecure. See http://twil.io/secure
  account_sid = ''
  auth_token = ''
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  message = @client.messages
    .create(
       body: 'Your takeaway will arrive in approx 1hr',
       from: '',
       to: ''
     )

  puts message.sid
=end
end
