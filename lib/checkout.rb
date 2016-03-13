require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Checkout

  def initialize(client)
    @client = client
  end

  def send_sms
    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM'],
      body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end

  private

  def time
    "#{Time.now.hour + 1}:#{Time.now.min}"
  end

end
