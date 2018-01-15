require_relative 'secrets'
require 'twilio-ruby'

class Messenger

  def initialize
    @secrets = Secrets.new
  end

  def confirm_order
    send_message("Thank you for your order. Your food will be delivered by #{estimate_time}")
  end

  private
  def send_message(message)
    Twilio::REST::Client.new(@secrets.account, @secrets.token).messages.create(
      from: @secrets.twilio_phone,
      to: @secrets.destination,
      body: message
      )
  end

  def estimate_time
    delivery_time = Time.now + 1800
    delivery_time.strftime("%H:%M")
  end
end
