class Text

  attr_reader :message, :delivery_time

  DEFAULT_DELIVERY_TIME_MINS = 180

  def initialize
    @message = nil
    @current_time = Time.new
  end

  def send(delivery_time = DEFAULT_DELIVERY_TIME_MINS)
    deliver_by = @current_time + delivery_time * 60
    deliver_by = deliver_by.strftime("%k:%M")
    @message = "Thank you! Your order was placed and will be delivered "\
   "before #{deliver_by}"
  end

  def message_sent?
    !@message.nil?
  end
end
