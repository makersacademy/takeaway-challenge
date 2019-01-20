require_relative 'menu'
require_relative 'send_sms'
require_relative 'order'
require 'dotenv/load'
require 'order_printer'

class Takeaway
  include OrderPrinter

  CONFIRMATION_MESSAGE = "Thank you! Your order was placed and will be " +
                         "delivered before "

  def initialize(args = {})
    @menu = args[:menu] || Menu.new
    @messenger = args[:twilio] || SendSms.new
    @order = args[:order] || Order.new(@menu)
  end

  def menu
    @menu.list
  end

  def take_order(dish, quantity = 1)
    @order.take(dish, quantity)
  end

  def checkout(customer_total)
    raise 'Halting Order: Unexpected Total' if @order.total != customer_total

    send_message(CONFIRMATION_MESSAGE + delivery_time)
  end

  def print_basket
    OrderPrinter.print_order(@order.basket, @order.total)

  end

  private

  def delivery_time
    one_hour = 3600
    current_time = Time.now + one_hour
    current_time.strftime('%H:%M')
  end

  def send_message(text)
    @messenger.create_message(text)
    text
  end

end
