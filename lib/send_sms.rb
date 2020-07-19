require 'twilio-ruby'

class Twilio_Class

  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_AUTH"]
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+12056971553'
  to = ENV["DMOB"]
  @client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before 18:52"
  )

end