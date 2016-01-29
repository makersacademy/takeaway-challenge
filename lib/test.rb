require 'twilio-ruby'

class Test

  account_sid = 'ACa017c4d8a2611154a0f08f692e71ff37'
  auth_token = '90e883e4f42336bcc377f4a14afb11ff'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
  from: '+441922214133',
  to: '+447780469088',
  body: 'Hey there!'
)


end
