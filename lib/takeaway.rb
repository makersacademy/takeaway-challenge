require 'dotenv'
require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  DELIVERY_TIME = 1

  def initialize(menu = Menu.new, order = Order.new, messenger = Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def read_menu
    menu.display_menu
  end

  def select_dishes(dishes)
    dishes.each do |item, quantity|
      order.add(item, quantity) if menu.has_dish?(item)
    end
    order.basket
  end

  def checkout
    total = order.order_total
    "You\'ve ordered #{total} items."
  end

  def confirm_order(number, phone = Dotenv.load['TWILIO_DESTINATION_PHONE'])
    raise 'Total number of dishes does not match. Please check again.' unless total_correct?(number)
    message = "Thank you! Your order was placed and will be delivered before #{delivery_clock}. Total price is £#{bill_total}"
    @messenger.send_text(message, phone)
    message
  end

  private

  attr_reader :menu, :order

  def total_correct?(number)
    order.order_total == number
  end

  def bill_total
    total = order.basket.map { |k, v| menu.display_menu[k] * v }.reduce(:+)
    sprintf('%.2f', total)
  end

  def delivery_clock
    t = Time.new + 60 * 60 * DELIVERY_TIME
    t.strftime "%H:%M"
  end
end
