require 'twilio-ruby'
require 'dotenv/load'

class Message

  def initialize(account_sid = ENV['TWILIO_ACCOUNT_SID'], auth_token = ENV['TWILIO_AUTH_TOKEN'], twilio_number = ENV['TWILIO_NUMBER'])
    @account_sid = account_sid
    @auth_token = auth_token
    @twilio_number = twilio_number
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send(phone_number = ENV['PHONE_NUMBER'])

    from = @twilio_number
    to = phone_number

    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )

  end

  private

  def delivery_time
    (Time.now + 60 * 60).strftime("%k:%M")
  end

end
