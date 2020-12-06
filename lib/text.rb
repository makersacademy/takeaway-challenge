require 'twilio-ruby'

time = Time.new

client = Twilio::REST::Client.new(
  ENV['TWILIO_ACCOUNT_SID'],
  ENV['TWILIO_AUTH_TOKEN']
)

client.messages.create(
  from: "[YOUR TWILIO NUMBER]",
  to: "[+447480318797]",
  body: "Thank you, your order has been placed! Estimated Deivery will be before #{time.hour + 1}:#{time.min}."
)