require 'twilio-ruby'
require 'dotenv'
require_relative 'order'

class Confirmation

  attr_reader :time
  
  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @time = (Time.now + 3600).strftime("%H:%M%p")
  end

  def checkout(payment)
    fail "something went wrong, try again" if payment != @total
    send_text
  end
   
  def send_text
    @client.messages.create(
    from: ENV['TWILIO_PHONE'],
    to: ENV['TWILIO_DESTINATION_PHONE'],
    body: ("Thank you! Your order was placed and will be delivered before #{@time}")
    )
  end
end
  
