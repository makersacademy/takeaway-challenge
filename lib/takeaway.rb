require_relative 'menu'
require_relative 'twilio_messanger'
require 'dotenv'
Dotenv.load

class Takeaway

  def initialize
    @menu = Menu.new
    @selection = {}
  end

  def select_item(item, quantity = 1)
    fail "Item not on menu" if list_menu[item].nil?
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
    check_order(value)
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
    (time.hour+1).to_s + ":" + sprintf('%2.2d',time.min)
  end

  def check_order(value)
    fail "You have not selected any items" if selection == {}
    message = "Order not confirmed, please check your total and try again."
    fail message if calculate_total != value
  end

end
