require 'twilio-ruby' 
class Send_message

def self.send
  account_sid = 'AC9b1f564c8a8482f73893fa3ed349d5bd'
  auth_token = '1a7408fb6f14309400dfb723b2d2a6f9'
  client = Twilio::REST::Client.new(account_sid, auth_token)
  
  from = '+441749200145' # Your Twilio number
  to = '+447535478794' # Your mobile phone number
  
  time = Time.new
  hour = time.hour + 1
  minutes = time.min
  
  client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before #{hour}:#{minutes}"
  )
end

end
