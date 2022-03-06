require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class TextMessage

  @@account_sid = ENV['ACCOUNT_SID']
  @@auth_token = ENV['AUTH_TOKEN']

  def initialize(client = Twilio::REST::Client.new(@@account_sid, @@auth_token))
    @client = client
  end

  def send_message
    @client.messages
      .create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        from: ENV['TWILIO_NUMBER'],
        to: ENV['CUSTOMER_NUMBER']
      )
  end

  private
  
  def delivery_time
    time = (Time.now + 1*60*60).strftime("%R")
  end
end
