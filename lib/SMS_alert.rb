require 'twilio-ruby'
require 'dotenv'

class SMS

  Dotenv.load

  def self.send_message(twilio_Klass = Twilio::REST::Client)
    sid = ENV['TWILIO_ACCOUNT_SID']
    token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['MY_TWILIO_NUMBER']
    phone_number = ENV['MY_PHONE_NUMBER']

    client = twilio_Klass.new sid, token
    client.messages.create(
      from: twilio_number,
      to:   phone_number,
      body: "Your order will be delivered at #{self.delivery_time}"
    )
  end

  def self.delivery_time
    time = (Time.new + 1*60*60).asctime
    hour_and_min = time[11,5]
  end
end
