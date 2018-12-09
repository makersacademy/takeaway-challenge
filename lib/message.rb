require 'twilio-ruby'
require 'dotenv/load'

class Message
  DATA = {
    sid: ENV['TWILIO_ACCOUNT_SID'],
    auth: ENV['TWILIO_AUTH_TOKEN'],
    from: ENV['TWILIO_FROM_NR'],
    to: ENV['TWILIO_TO_NR']
  }

  def send(message = generate_message)
    Twilio::REST::Client.new(DATA[:sid], DATA[:auth])
          .messages
          .create(
            from: DATA[:from],
            to: DATA[:to],
            body: message
          )
    message
  end

  private

  def delivery_time(time = Time.now)
    time += 3600
    time.strftime("%H:%M")
  end

  def generate_message
    "Thank you! Your order was placed "\
    "and will be delivered before #{delivery_time}"
  end
end
