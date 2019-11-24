require "twilio-ruby"

class TextProvider
  TWILIO_PHONE_NUMBER = ENV["TWILIO_PHONE_NUMBER"]
  MY_PHONE_NUMBER = ENV["MY_PHONE_NUMBER"]
  TWILIO_ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
  TWILIO_AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]
  
  def initialize(time_formatter = TimeFormatter.new)
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    @time_formatter = time_formatter
  end

  def send_message
    delivery_time = @time_formatter.delivery_time
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @client.messages.create(from: TWILIO_PHONE_NUMBER, to: MY_PHONE_NUMBER, body: message)
    message
  end
end
