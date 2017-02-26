require 'dotenv'
require 'twilio-ruby'

class Message


  attr_reader :client

  def initialize(client: nil)
    @client = client ||   Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def deliver
    @client.messages.create(
      :to => ENV['CUSTOMER_NUMBER'],
      :from => ENV['TWILIO_NUMBER'],
      :body => message_content
      )
  end

  private

  def message_content
    delivery_time = (Time.now + 60*60).strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
