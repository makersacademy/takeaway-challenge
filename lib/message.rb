require 'twilio-ruby'

class Message
  CONF = {
    sid: ENV['TWILIO_SID'],
    auth: ENV['TWILIO_KEY'],
    from: ENV['TWILIO_NUM'],
    to: ENV['MOBILE_NUM']
  }.freeze

  def send_message(total = 0)
    client_send(message = generate_message(total))
    message
  end

  private

  def delivery_time
    Time.new + 3600
  end

  def generate_message(total = 0)
    "Thank you! Your order came to £#{ total }. "\
    "Our baristas are new, so expect your drinks "\
    "at #{ delivery_time.strftime('%I:%M%P') }"
  end

  def client_send(message)
    Twilio::REST::Client.new(CONF[:sid], CONF[:auth]).messages.create(
      from: CONF[:from],
      to: CONF[:to],
      body: message
    )
  end
end
