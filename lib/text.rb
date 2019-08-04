require 'twilio-ruby'

def text(mobile, time, change)
  account_sid = "AC2e1ac993aca31d47424ddfde7fcf6003"
  auth_token = "fcb1d50ca850ac2e4562cde3ce09f561"
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  from = '+441288255120' 
  to = mobile
  @client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before #{time}! Your change is: £#{change}"
  )
end
