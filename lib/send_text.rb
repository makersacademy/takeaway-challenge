require 'twilio-ruby'
require_relative 'delivery_time'
require 'dotenv/load'

class SendText

  def initialize(twilio = Twilio::REST::Client, del_time = DeliveryTime.new)
    @client = twilio.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    @delivery_time = del_time
  end

  def send
    time = @delivery_time.generate_time
    @message = @client.messages.create(
      body: "Thanks! Your order was placed, it'll be delivered before #{time}",
      to: ENV['TO_NO'],
      from: ENV['FROM_NO']
    )
    raise "Sorry, text message failed to send!" unless message_sent?
  end

  private

  def message_sent?
    !!@message.sid
  end

end
