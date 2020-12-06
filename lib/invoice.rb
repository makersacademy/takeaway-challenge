require 'dotenv/load'
require 'twilio-ruby'

$twilio_info = {
  :account_sid => ENV['TWILIO_ACCOUNT_SID'],
  :auth_token => ENV['TWILIO_AUTH_TOKEN'],
  :from => ENV['TWILIO_FROM'],
  :to => ENV['TWILIO_TO']
}

class Invoice

  def initialize(twilio = $twilio_info)
    @twilio = twilio
    @total = 0
  end

  def calculate(order)
    order.each do |dish|
      @total += dish[:quantity] * dish[:price_per_item]
    end
    format('%<price>.2f', price: @total)
  end

  def send_text(client = Twilio::REST::Client.new(@twilio[:account_sid], @twilio[:auth_token]))
    delivery_time = (Time.new + 3600).strftime("%k:%M")
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"

    client.messages.create(
      from: @twilio[:from],
      to: @twilio[:to],
      body: message
    )
    "sms sent"
  end

end
