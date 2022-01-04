class Message
  def initialize(sms)
    @sms = sms
  end

  def confirm(number, delivery_time)
    body = format_message(delivery_time)
    @sms.message(number, body)
    body
  end

  def format_message(delivery_time)
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
