require_relative 'smsmessager'
require 'twilio-ruby'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = { chicken_noodle_soup: 4.95,
      duck_spring_rolls: 4.95,
      crispy_duck: 8.95,
      singapore_fried_noodles: 7.95,
      steamed_rice: 2.95 }
  end

  def complete_order(order_total)
    SmsMessager.send_text("Thank you! Your order total of £#{order_total} was placed and will be delivered before #{delivery_time}")
  end

  def delivery_time
    current_time = Time.now
    delivery_hour = current_time.hour + 1
    delivery_minute = current_time.min
    "#{delivery_hour}:#{delivery_minute}"
  end

end
