require 'rubygems'
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
aut_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
    body: 'Thank you for you order, estimated delivery is: ',
    from: '+18593747532',
    to:   '+44 7722 236999'
  )

puts message.sid
