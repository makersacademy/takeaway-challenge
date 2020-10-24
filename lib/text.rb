require 'twilio-ruby'
class Text
  def initialize(phone_number)
    @phone_number = "+44#{phone_number}"
  end

  def send_text
    account_sid = ENV['TWILIO_ACCOUNT_SID']; auth_token = ENV['token']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['num'] # Your Twilio number
    to = @phone_number # customers mobile phone number
    time = (Time.now + 60 * 60).strftime("%k:%M")
    client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{time}",
    from: from,
    to: to)
  end
end
