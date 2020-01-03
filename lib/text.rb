require 'dotenv/load'
require 'twilio-ruby'
require 'time'

class Text
  DELIVERY_TIME = 3600

  def initialize(to = ENV['TELEPHONE'])
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @from = ENV['TWILIO_NUMBER']
    @to = to
  end
  
  def send_text
    message = "Thank you! Your order was placed and will be delivered before #{arrival_time}."
    
    @client.messages.create(
      from: @from,
      to: @to,
      body: message
    )
  end

  private
  
  def arrival_time
    (Time.now + DELIVERY_TIME).strftime("%k:%M")
  end
end
