require 'twilio-ruby'
require 'dotenv/load'

class Message

  def initialize(client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']), twilio_number = ENV['TWILIO_NUMBER'])
    @twilio_number = twilio_number
    @client = client
  end

  def send

    create_message

  end

  def create_message(phone_number = ENV['PHONE_NUMBER'])

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
