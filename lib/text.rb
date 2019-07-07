class Text

  attr_reader :message, :delivery_time

  DEFAULT_DELIVERY_TIME = Time.new + 30 * 60

  def initialize
    @message = nil
  end

  def send(delivery_time = DEFAULT_DELIVERY_TIME)
    @message = "Thank you! Your order was placed and will be delivered "\
   "before #{delivery_time}"
  end

  def message_sent?
    !@message.nil?
  end
end
