require 'twilio-ruby'
require 'date'
def text_order(mobile, message)

  account_sid = 'AC3a056cbdc611c90101e51bf51d698716'
  auth_token = '6903b5665b11545a4383a2ed0e071f7a'
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+441753254391' # Your Twilio number
#  to = mobile # Your mobile phone number

  message = client.messages.create(
  from: from,
  to: mobile,
  body: message
  )
  puts message.sid
end
