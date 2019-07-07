require 'send_sms'

class Text
  include SMS

  attr_reader :message, :message_sent

  DEFAULT_DELIVERY_TIME_MINS = 60

  def initialize(mobile)
    @mobile = mobile
    @delivery_time = delivery_time
    @message = "Thank you! Your order was placed and will be delivered "\
      "before #{@delivery_time}"
    @message_sent = false
  end

  def send
    send_sms(@mobile, @message)
    @message_sent = true
  end

  def delivery_time
    delivery_time = Time.new + DEFAULT_DELIVERY_TIME_MINS * 60
    delivery_time.strftime("%k:%M")
  end
end
