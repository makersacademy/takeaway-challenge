require 'twilio-ruby'

class Message
  def initialize
    @twilio = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_KEY'])
  end

  def send_message(total = 0)
    message = generate_message(total)
    twilio.messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MOBILE_NUM'],
      body: message
    )
    message
  end

  private

  attr_reader :twilio

  def delivery_time
    Time.new + 3600
  end

  def generate_message(total)
    "Thank you! Your order came to £#{ total }. "\
    "Our baristas are new, so expect your drinks "\
    "at #{ delivery_time.strftime('%I:%M%P') }"
  end
end
