require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  DELIVERY_TIME = (Time.now + 3600).strftime("%H:%M")

  attr_reader :client

  def initialize(client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))
    @client = client
    @phone = ENV['TWILIO_PHONE']
  end

  def send
    confirmation_message = "Thank you for your order. Your order has been placed and will be delivered before #{DELIVERY_TIME}."
    twilio_message_body = { 
      from: ENV['TWILIO_PHONE'], 
      to: ENV['TWILIO_DESTINATION_PHONE'], body: confirmation_message }
    @client.messages.create(twilio_message_body)
  end 
end


