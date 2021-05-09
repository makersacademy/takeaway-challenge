require 'twilio-ruby'
require 'dotenv/load'

class Message

  DELIVERY_TIME = (Time.now + 3600).strftime("%H:%M")

  attr_reader :client

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token =  ENV['TWILIO_AUTH_TOKEN']

  def initialize(client = Twilio::REST::Client.new(account_sid, auth_token), phone = ENV['TWILIO_PHONE'])
    @client = client
    @phone = phone 
  end

  def send
    confirmation_message = "Thank you for your order. Your order has been placed and will be delivered before #{DELIVERY_TIME}."

    twilio_message_body = { 
      from: ENV['TWILIO_PHONE'], 
      to: ENV['TWILIO_DESTINATION_PHONE'], body: confirmation_message }
  
    @client.messages.create(twilio_message_body)
  end  
end 