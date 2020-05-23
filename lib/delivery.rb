require_relative 'text_message'

class Delivery

  def initialize(text_message_class = Text_message)
    @delivery_time = calculate_delivery_time
    user_delivery_notification
    send_text(text_message_class)
  end

  def user_delivery_notification
    puts delivery_notification
  end

  private

  def calculate_delivery_time
    format_delivery_time(Time.now + (60 * 60))
  end

  def format_delivery_time(time)
    time.strftime("%k:%M")
  end

  def delivery_notification
    "Order placed! It will be delivered by #{@delivery_time}"
  end

  def send_text(text_message_class)
    text_message_class.new(delivery_notification)
  end

end
