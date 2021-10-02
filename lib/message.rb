class Message
  def format_message
    delivery_time = (Time.now + 3600).strftime("%k:%M") 
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
