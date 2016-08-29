#understands the client interactions
require_relative "menu.rb"
require_relative "order_log.rb"
require 'twilio-ruby'

class TakeAway

  def initialize(menu_class = Menu.new, order_log_class = OrderLog.new, twilio = Twilio::REST::Client)
    @twilio = twilio
    @menu_class = menu_class
    @order_log_class = order_log_class
    account_sid, auth_token = ENV['TWILIO_ACC_SID'], ENV['TWILIO_AUTH_TOKEN']
    @client = @twilio.new(account_sid, auth_token)
  end

  def start_order #calls start_order on order_log
    order_log_class.start_order
  end

  def show_menu #show formatted menu
    format_menu(ask_for_menu)
  end

  def add_item(dish_id, quantity) #adds item to order
    fail "Please add a proper quantity" unless quantity_correct?(quantity)
    fail "Dish is not available" unless dish_available?(dish_id)
    order_log_class.add_item(ask_for_menu[dish_id], quantity)
  end

  def summary #returns summary, received from order_log
    order_log_class.order_summary
  end

  def total #returns the total value of the current order
    "Total: £#{order_log_class.total}"
  end

  def checkout(amount) #check out current order and send sms if completed
    order_log_class.checkout_order(amount)
    send_text_message(compose_text_body)
    "Checkout completed. Confirmation has been sent in a text message"
  end

  private

  attr_reader :menu_class, :order_log_class

  def quantity_correct?(quantity) #checks if quantity is correct
    quantity.class == Fixnum && quantity > 0
  end

  def dish_available?(dish_id) #checks if dish is available in menu
    ask_for_menu.include?(dish_id)
  end

  def compose_text_body #returns body of the sms
    t = Time.now + (60 * 60)
    "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}."
  end

  def send_text_message(message) #sends text message
    @message = @client.messages.create(
      to: ENV['TWILIO_PHONE_NR_TO'],
      from: ENV['TWILIO_PHONE_NR_FROM'],
      body: message
    )
  end

  def ask_for_menu #returns menu received from menu class
    menu_class.menu
  end

  def format_menu(menu) #formats the menu to be easily readable
    menu.to_a.map do |dish|
      "ID: #{dish[0]} Name: #{dish[1].name}, Price: #{dish[1].price}"
    end.join(" | ")
  end
end
