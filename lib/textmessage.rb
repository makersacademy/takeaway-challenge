class TextMessage
  
  CONFIRMATION = "Thank you! Your order was placed and will be delivered before"

  def send_message(order)
    delivery_estimate = order.time + 1 * 60 * 60
    message = CONFIRMATION + "#{delivery_estimate.strftime("%k:%M")}"
    do_send(message)
  end

  private
  
  def do_send(message)
    # TODO this would send the message through the Twilio API
    puts message
  end

end
