require 'twilio-ruby'
require 'time'

class Sms

  def initialize(time = Time.now)
    @eta = (time + 3600).to_s[11..15]
  end

  def send
    create(client_info)
  end

  private

  def client_info
    Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
  end

  def create(client)
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['CELL_PHONE_NUMBER'],
      body: "Thank you! Your order will be delivered before #{@eta}"
    )
  end

end
