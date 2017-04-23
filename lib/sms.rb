require 'twilio-ruby'
require 'envyable'
Envyable.load('config/env.yml')

class Sms
  attr_accessor :client

  def initialize(customer: nil)
    @client = customer || Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def send_message
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['CUSTOMER_NUMBER'],
      body: text_message
    )
  end

  def text_message
    'Thank you for ordering from Hangover Palace! Your order was placed ' +
    "successfully. Your order no. is #{rand(999_999)}. It will be delivered " +
    "before #{(Time.now + 3750).strftime("%H:%M")}. Have a great day!"
  end
end
