require 'twilio-ruby'
require 'dotenv/load'

class Message
  def initialize(client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
    @client = client
  end  

  def send_message
    @client.messages.create(info)
  end

private

  def info
    {
    body: "Thank you! Your order will be delivered before #{delivery_time}",
    from: ENV['TWILIO_NO'],
    to: ENV['CUSTOMER_NO']
    }
  end

  def delivery_time
    "#{(Time.now + 3600).strftime('%H:%M')}"
  end

end
