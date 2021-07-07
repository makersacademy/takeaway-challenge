require_relative 'text_message'

class Delivery

  def initialize(text_message_class = TextMessage)
    @delivery_time = calculate_delivery_time
    user_delivery_notification
    mob_number = enter_mob_number
    send_text(text_message_class, mob_number)
  end

  def user_delivery_notification
    puts delivery_notification
  end

  private

  def mobile_number_correct?(number)
    number[0] == "+" && number.length == 13
  end

  def calculate_delivery_time
    format_delivery_time(Time.now + (60 * 60))
  end

  def format_delivery_time(time)
    time.strftime("%k:%M")
  end

  def delivery_notification
    "Order placed! It will be delivered by #{@delivery_time}"
  end

  def enter_mob_number
    puts "Enter mobile number"
    STDIN.gets.chomp
  end

  def send_text(text_message_class, mob_number)
    text_message_class.new(delivery_notification, mob_number)
  end

end
