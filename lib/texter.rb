require 'twilio-ruby'

class Texter
  def initialize(phone_number)
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @phone_number = phone_number
  end

  def send_text
    @client.messages.create(
      from: "+13187268490",
      to: @phone_number,
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    )
    "Text message sent"
  end
end

texter = Texter.new(ENV['TOMMY_MOBILE_NUMBER'])
texter.send_text