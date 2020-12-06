require("bundler")
Bundler.require()

time_now = Time.new

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  to: ENV["MY_UK_NUMBER"],
  from: "+447476559863",
  body: "Thank you! Your order was placed and will be delivered before #{time_now.hour + 1}:#{time_now.min}."
)
