# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require "rubygems"
require "twilio-ruby"

account_sid = "AC2e188a8f207af19460885e297d38fd5f"
auth_token = "ab7e2ccff7b29f06861bc5ae2af7a902"
@client = Twilio::REST::Client.new(account_sid, auth_token)
time_now = Time.new
message = @client.messages
  .create(
    body: "\nThank you for your order!\nYour total: #{$sum} \nEstimated delivery #{time_now.hour + 1}:#{time_now.min}.",
    from: +12673135020,
    to: +4407578084984,
  )
