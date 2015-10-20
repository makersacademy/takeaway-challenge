require 'twilio-ruby'
require_relative '.env'

class TwilioSend

  def message
    time = (Time.new + 3600).strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{time}."
  end

  def sms(mobile)
    @twilio_number = ENV[:number]
    @client = Twilio::REST::Client.new ENV[:account_sid], ENV[:auth_token]
    @client.messages.create(
      body: message,
      from: @twilio_number,
      to: mobile.to_s
      )
  end

end
