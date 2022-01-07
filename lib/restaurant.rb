require 'twilio-ruby'
require_relative 'order'

class Restaurant
  def initialize(menu)
    @menu = menu

    @twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def menu
    @menu.clone
  end

  def order_total(order)
    check_items_available(order)
    order.items.map { |item| @menu[item] }.sum
  end

  def delivery_time
    Time.now + COOKING_TIME + TRAVEL_TIME
  end

  def place_order(order)
    raise 'Order must contain at least one item' if order.items.empty?
    check_items_available(order)
    send_text(order.mobile)
  end

  def send_text(mobile)
    @twilio_client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: mobile,
      body: delivery_time.strftime(
        'Thank you! Your order was placed and will be delivered before %H:%M'
      )
    )
  end

  private

  COOKING_TIME  = 50 * 60
  TRAVEL_TIME   = 10 * 60

  def check_items_available(order)
    error_msg = "Invalid order - #{items_not_on_menu(order)} are not on the menu"
    raise error_msg unless items_not_on_menu(order).empty?
  end

  def items_not_on_menu(order)
    order.items.uniq - @menu.keys
  end
end
