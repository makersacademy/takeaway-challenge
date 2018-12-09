require 'twilio-ruby'
require 'dotenv/load'

class Message
  def send
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
    from: ENV['TWILIO_FROM_NR'],
    to: ENV['TWILIO_TO_NR'],
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end
