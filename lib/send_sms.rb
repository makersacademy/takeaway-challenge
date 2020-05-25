# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

def send_sms(message)
  client = Twilio::REST::Client.new(
  ENV['TWILIO_ACCOUNT_SID'],
  ENV['TWILIO_AUTH_TOKEN']
  )

  client.messages.create(
    from: ENV['TWILIO_TRIAL_NUMBER'],
    to: ENV['MY_NUMBER'],
    body: "#{message} #{(Time.now + 3600).strftime("%H:%M")}"
  )

  return "Order confirmed!"
end
