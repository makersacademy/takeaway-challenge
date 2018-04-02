require 'twilio-ruby'
require_relative 'time_function'


class TextMessage

  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end


  def send_message(number)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+#{number}",
      body: "Your order has been placed and will arrive before #{TimeFunction.new.time_plus_one_hour}"    )
  end

end
