require 'dotenv/load'
require 'twilio-ruby'
require 'time'

class Text
  DELIVERY_TIME = 3600

  def initialize(to = ENV['TELEPHONE'])
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV['TWILIO_NUMBER']
    @to = to
  end

  def send_text
    arrival_time = (Time.now + DELIVERY_TIME).strftime("%k:%M")
    message = "Thank you! Your order was placed and will be delivered before #{arrival_time}."

    @client.messages.create(
    from: @from,
    to: @to,
    body: message
    )
  end
end