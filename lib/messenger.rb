require 'twilio-ruby'
require 'dotenv/load'

class Messenger

  CONF = {
    sid: ENV['ACCOUNT_SID'],
    auth: ENV['TWILIO_AUTH_TOKEN'],
    from: ENV['FROM'],
    to: ENV['TO']
  }

  def initialize
    @client = Twilio::REST::Client.new(CONF[:sid], CONF[:auth])
  end

  def send(total)
    @client.messages.create(
      from: CONF[:from],
      to: CONF[:to],
      body: body(total)
    )
    "Message sent"
  end

  def body(total)
    "Thank you for your order. Delivery estimated for " +
    "#{delivery_time.strftime('%H:%M')}. The total came to #{total}"
  end

  def delivery_time
    Time.now + 3600
  end

end
