# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'


def send_sms
  client = Twilio::REST::Client.new(
  ENV['TWILIO_ACCOUNT_SID'],
  ENV['TWILIO_AUTH_TOKEN']
  )


  message = client.messages.create(
    from: ENV['TWILIO_TRIAL_NUMBER'],
    to: ENV['MY_NUMBER'],
    body: "Thank you! Your order was placed and will be delivered before #{Time.now.strftime("%H:%M")}"
  )

  return "Order confirmed!"
end
