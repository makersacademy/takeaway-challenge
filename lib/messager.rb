require 'dotenv'
require 'twilio-ruby'

class Messager

  attr_reader :content_manager

  def initialize(content_manager)
    Dotenv.load
    @content_manager = content_manager
  end

  def send_text(order_cost)
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).
    messages.create(
        from: ENV['TWILIO_SOURCE_PHONE'],
        to: ENV['TWILIO_DESTINATION_PHONE'],
        body: content_manager.body_msg(order_cost)
    )
  end
end
