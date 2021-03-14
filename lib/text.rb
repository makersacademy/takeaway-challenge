require 'twilio-ruby'
require 'dotenv/load'

class Text

  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def send_text
    @client.messages.create(
      from: ENV['PHONE_FROM'],
      to: ENV['PHONE_TO'],
      body: "Thank you! Your order was placed and will be delivered before #{Time.now + 60 * 60}"
    )
  end
end
