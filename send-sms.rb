require 'twilio-ruby'
require("bundler")
Bundler.require()

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

time_next_hour = (Time.new + 3600).strftime("%I:%M %p")

@client.messages.create(
  to: ENV["OLLIES_PHONE_NUMBER"],
  from: "+447427567563",
  body: "Thank you! Your order was placed and will be delivered before #{time_next_hour}"
)