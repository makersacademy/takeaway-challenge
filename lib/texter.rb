require 'dotenv/load'
require 'twilio-ruby'
require_relative 'time_function'

# class is responsible for sending texts to customers
class Texter
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def send_message(number)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+#{number}",
      body: "Your order was placed and will be delivered before #{TimeFunction.new.time_plus_one_hour}. Thank you! 🍖"
    )
  end
end
