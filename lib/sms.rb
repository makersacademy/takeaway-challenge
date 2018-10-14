require 'twilio-ruby'
require 'dotenv/load'

class SMS
  def initialize
    @twilio_sid = ENV['TWILIO_ACCOUNT_SID']
    @twilio_auth = ENV['TWILIO_ACCOUNT_AUTH']
    @client = Twilio::REST::Client.new @twilio_sid, @twilio_auth
  end

  def time
    add_hour = Time.now + 3600
    add_hour.strftime("%H:%M")
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

  def send_sms
    @client.api.account.messages.create(
    from: "+441158245875",
    to: "+447414209209",
    body: message
    )
  end
end
