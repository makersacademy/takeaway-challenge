require 'send_sms'

class Text
  include SMS

  attr_reader :message, :delivery_time

  DEFAULT_DELIVERY_TIME_MINS = 60

  def initialize(mobile)
    @mobile = mobile
    @message = nil
    @current_time = Time.new
  end

  def send(delivery_time = DEFAULT_DELIVERY_TIME_MINS)
    @delivery_time = delivery_time
    @message = "Thank you! Your order was placed and will be delivered "\
      "before #{deliver_by}"
    send_sms(@mobile, @message) 
  end

  def message_sent?
    !@message.nil?
  end

  private

  def deliver_by
    time = @current_time + delivery_time * 60
    time.strftime("%k:%M")
  end
end
