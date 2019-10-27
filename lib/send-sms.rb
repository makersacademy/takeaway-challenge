require 'bundler'

Bundler.require()

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)
@delivery = (Time.now + 3600).strftime("%H:%M")

@client.messages.create(
  to: ENV["PHONENUMBER"],
  from: "+14157023734",
  body: "Thank you! Your order was placed and will be with you by #{@delivery}."
)
