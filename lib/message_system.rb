require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class MessageSystem

  def send
    send_message
    message_body
  end

  private

  FROM = ENV['TWILIO_FROM'].freeze
  TO = ENV['TWILIO_TO'].freeze
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN'].freeze
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID'].freeze

  def message_body
    "Thank you!"\
    " Your order was placed and will be delivered before #{one_hour_time}"
  end

  def send_message
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    client.account.messages.create(from:FROM, to:TO, body:message_body)
  end

  def one_hour_time
    one_hour = Time.now + 60*60
    one_hour.localtime.strftime("%H:%M")
  end
end
