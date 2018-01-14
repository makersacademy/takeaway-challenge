require_relative 'order'
require_relative 'menu'
require 'dotenv/load' # loads local .env file with twilio authentication
require 'date'

class Takeaway

  attr_reader :menu

  def initialize(order_class = Order, menu_class = Menu)
    @menu = menu_class.new
    @order = order_class.new(@menu)
  end

  def order(item, qty = 1)
    # create_order unless @order
    @order.add(item, qty)
  end

  def order_summary
    @order.to_s
  end

  def check_total
    @order.total
  end

  def submit
    send_sms("Thank you for your order! It should arrive at #{estimated_delivery_time}")
  end

  private

  def send_sms(message)
    message
  end

  def estimated_delivery_time
    estimated_time = Time.now + 30*60
    estimated_time.strftime("%H:%M")
  end

end