class Message

  def send_text
  "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  def delivery_time
    time = Time.now + 60 * 60
    time.strftime("%H:%M")
  end
end
