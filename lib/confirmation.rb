require 'twilio-ruby'
require_relative "order"

class Confirmation
  # Sends a confirmation text message

  attr_reader :time

  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @time = (Time.now + 3600).strftime("%H:%M%p")
  end


  def send_message(message)
    @client.messages.create(
    from: ENV['TWILIO_PHONE'],
    to: ENV['TWILIO_DESTINATION_PHONE'],
    body: message
    )
  end

  def complete_order
    send_message("Thank you! Your order was placed and will be delivered before #{@time}")
  end

end
