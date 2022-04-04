require_relative './environment'

require 'twilio-ruby'

def text
  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV["AUTH_TOKEN"]
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = ENV["FROM"] # Your Twilio number
  to = ENV["TO"] # Your mobile phone number

  client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  )
end

def delivery_time
  hour_later = Time.now + 3600
  delivery = hour_later.strftime('%H:%M')
end
