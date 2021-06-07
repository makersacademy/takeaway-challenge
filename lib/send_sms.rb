require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  from: ENV["MY_PHONE_NUMBER"],
  to: ENV["OTHER_NUMBER"],
  body: "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}"
)


