require 'twilio-ruby'
require 'rubygems'

def sms
  account_sid = ENV[TWILIO_ACCOUNT_SID]
  auth_token = ENV[AUTH_TOKEN]
  num = ENV[NUM]

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  message = @client.messages
    .create (
    body: "Thank you, your order has been placed and will arrive at #{(Time.new + 3600).strftime("%H:%M")}."
    from: '+12513571363'
    to: num
  )

  puts message.sid
  
end