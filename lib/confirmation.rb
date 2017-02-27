require "twilio-ruby"
require 'time'
require_relative "order"

class Confirmation

  TIME_FORMAT = "%H:%M"

  attr_reader :time

  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @time = (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end

  def complete_order
    send_text("Your order has been placed and will be delivered around #{@time}")
  end

  def send_text(message)
    @client.messages.create(
    from: ENV['TWILIO_PHONE_NUMBER'],
    to: ENV['MOBILE'],
    body: message
    )
  end

end
