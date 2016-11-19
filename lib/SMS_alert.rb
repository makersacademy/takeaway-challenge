require 'twilio-ruby'

class SMS

  ACCOUNT_SID = "AC897f510f4d323f75fa515d37af48e0a8"
  AUTH_TOKEN = "6d2fc586fde0fdcf468224eb7129d24d"

  def self.send_message(twilio_Klass = Twilio::REST::Client)
    twilio_number = "+441285610094"
    phone_number = "+447827441666"
    client = twilio_Klass.new ACCOUNT_SID, AUTH_TOKEN
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
