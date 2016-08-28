require_relative "menu.rb"
require_relative "order_log.rb"
require_relative "takeaway"
require 'twilio-ruby'

class Restaurant
  include TakeAway

  def initialize(menu_class = Menu.new, order_log_class = OrderLog.new)
    @menu_class = menu_class
    @order_log_class = order_log_class
    account_sid = ENV['TWILIO_ACC_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def start_order
    order_log_class.start_order
  end

  def show_menu
    menu_class.menu
  end

  def add_item(dish_id, quantity)
    fail "Please add a proper quantity" unless quantity_correct?(quantity)
    fail "Dish is not available" unless dish_available?(dish_id)
    order_log_class.add_item(show_menu[dish_id], quantity)
  end

  def order_summary
    order_log_class.order_summary
  end

  def total
    #receives the total value of the current order
    order_log_class.total
  end

  def checkout(amount)
    order_log_class.checkout_order(amount)
    send_text_message(compose_text_body)
  end

  private

  attr_reader :menu_class, :order_log_class

  def quantity_correct?(quantity)
    quantity.class == Fixnum && quantity > 0
  end

  def dish_available?(dish_id)
    show_menu.include?(dish_id)
  end

  def compose_text_body
    t = Time.now + (60 * 60)
    "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}."
  end

  def send_text_message(message)
    @message = @client.messages.create({
      to: ENV['TWILIO_PHONE_NR'],
      from: ENV['TWILIO_PHONE_NR'],
      body: message
    })
  end
end
