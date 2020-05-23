class Delivery

  def calculate_delivery_time
    format_delivery_time(Time.now + (60 * 60))
  end

  def format_delivery_time(time)
    time.strftime("%k:%M")
  end

  def user_delivery_notification
    puts "Order placed! It will be delivered by #{calculate_delivery_time}"
  end

end
