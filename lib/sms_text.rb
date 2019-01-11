require 'twilio-ruby'


class SMSText

  def initialize(client = Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]))
    @client = client
    @time = (Time.now + 1800).strftime("%H:%M")
  end

  def send_sms
    @client.messages.create(
        from: ENV["TWILIO_NUM"], # Your Twilio number
        to: ENV["MY_NUM"], # Your mobile phone number
        body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
  end

end