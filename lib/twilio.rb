require 'twilio-ruby'

account_sid = 'ACb1d1628b09d813d495770839f36332f3'
auth_token = 'yyy'

client = Twilio::REST::Client.new(account_sid, auth_token)

client.messages.create(
  from: '+442033222694',
  to: '+447561483699',
  body: "Hey, Monkey party at 6PM. Bring Bananas!"
)
puts "Sent message!"
