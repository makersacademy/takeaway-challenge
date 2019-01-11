require 'twilio-ruby'


class SMSText

  def initialize(client = Twilio::REST::Client.new(ENV["SID"], ENV["TOKEN"]))
    @client = client
    @time = (Time.now + 1800).strftime("%H:%M")
  end

  def send_sms
    @client.messages.create(
        from: ENV["MY_NUMBER"], # Your Twilio number
        to: ENV["TWILIO_NUMBER"], # Your mobile phone number
        body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
  end

end