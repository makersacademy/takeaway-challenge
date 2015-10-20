require 'twilio-ruby'

class TwilioSend

  def message
    time = (Time.new + 3600).strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{time}."
  end

  def sms(mobile)
    @twilio_number = ENV['NUMBER']
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @client.messages.create(
      body: message,
      from: @twilio_number,
      to: mobile.to_s
      )
  end

end
