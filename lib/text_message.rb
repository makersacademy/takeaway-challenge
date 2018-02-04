class TextMessage

  def send
    time = Time.now
    puts "Thank you for your order. Delivery will be at #{time + 1800}"
  end

end
