require 'twilio-ruby'
require_relative 'order'
require 'dotenv/load'
Dotenv.load('twilio.env')

class Confirmation
  attr_reader :time

  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @time = (Time.now + 3600).strftime("%H:%M:%S")
  end

  def complete_order
    send_sms("Thank you! Your order was placed and will be delivered before #{time}.")
  end

  def send_sms(message)
    @client.messages.create(
        :from => ENV['TWILIO_NUMBER'],
        :to => ENV['TWILIO_USER'],
        :body => message
        )
  end
end

  # Your Auth Token from www.twilio.com/console
