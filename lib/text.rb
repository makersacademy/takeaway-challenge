class Text

  DEFAULT_MESSAGE = "Thank you! Your order was placed and will be delivered "\
  "before #{@delivery_time}"
  attr_reader :message_sent

  def initialize
    @message_sent = nil
    @order_time = Time.new
    @delivery_time = order_time + 30*60
  end

  def send
    @message_sent = DEFAULT_MESSAGE
  end

  def message_sent?
    !@message_sent.nil?
  end

  private
  attr_reader :order_time
end
