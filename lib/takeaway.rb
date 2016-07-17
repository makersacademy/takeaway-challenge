require_relative 'menu'
require_relative 'twilio_messanger'
require 'dotenv'
Dotenv.load

class Takeaway

  def initialize
    @menu = Menu.new
    @selection = {}
  end

  def select_item(item, quantity)
    @selection[item] = quantity
  end

  def selection
    @selection.dup
  end

  def calculate_total
    sum = 0
    selection.each_pair { |item, quantity| sum += (list_menu[item].to_f * quantity)}
    sum
  end

  def confirm_order(value)
    message = "Order not confirmed, please check your total and try again."
    raise message if calculate_total != value
    send_text
    @selection = {}
    "Order confirmed"
  end

  def list_menu
    @menu.display_menu
  end

  private

  def send_text
    text = TwilioMessanger.new
    message_body = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    text.message(message_body)
  end

  def delivery_time
    time = Time.new
    (time.hour+1).to_s + ":" + (sprintf('%2.2d',time.min))
  end

end
