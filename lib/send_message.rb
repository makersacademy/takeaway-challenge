require 'twilio-ruby' 
require 'dotenv'
Dotenv.load

class Send_message

def self.send
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
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
