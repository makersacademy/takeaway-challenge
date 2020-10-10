require 'twilio-ruby'
require_relative 'takeaway'
require_relative 'printer'

  account_sid = 'ACe2bd41f5d7f0d8935146e550607b55b7'
  auth_token = '0167788d1bb31eb24992403abc17ce15'
  client = Twilio::REST::Client.new(account_sid, auth_token)
  
  from = '+13343360949' # Your Twilio number
  to = '+447947558293' # Your mobile phone number
  
  client.messages.create(
  from: from,
  to: to,
  body: "Thank you for your order: £#{total_price}"
  )