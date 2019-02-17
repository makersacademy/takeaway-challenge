class Submission
  def initialize(order = Order.new)
    @order = order

    error_message = "Add items to order first. Cannot submit empty order."
    raise error_message if order.total == 0

    submit_order
  end

  def submit_order
    sms_text = "Thank you! Your order was placed at 17:52 and should be with you by 18:52."    
    self.send_text(sms_text)
  end

  def send_text(message)
    message
  end
end