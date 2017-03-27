require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml')

# uses the Twilio API to send confirmation text
class Sms

  def send(amount)
    account_sid = ENV["TWIIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441158243897" # Your Twilio number
    to = ENV["NUMBER"]

    time = delivery_time
    amount = amount

    client.account.messages.create(
      :from => from,
      :to => to,
      :body => "Thank you! Your order for £#{amount} was placed and will be delivered before #{delivery_time}"
    )
    puts "SMS successfully sent"
  end

  def delivery_time
    (Time.now + 3600).strftime('%H:%M')
  end
end
