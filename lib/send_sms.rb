require 'twilio-ruby'

@client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

@client.account.messages.create(
  from: ENV["TWILIO_FROM_NO"],
  to: ENV["TWILIO_TO_NO"],
  body: "Thank you for your custom! Your order will be delivered before #{(Time.now + 3600).strftime("%R")}."
)
