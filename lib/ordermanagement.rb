require_relative 'order'
require_relative 'menu'
require_relative 'twilio_sms'

class OrderManagement

  include TwilioSMS

  attr_reader :new_orders

  def initialize
    @processed_orders = []
    @failed_orders = []
    @menu = Menu.new
  end

  def create_order(*order, total)
    order_details = Hash[*order]
    new_order = Order.new(order_details, total)
    check_price(new_order) ? place(new_order) : record_failed_orders(new_order)
  end

private

  def check_price(order)
    order.calculated_total == order.customers_expected_total
  end

  def record_failed_orders(order)
    @failed_orders << order
    fail "Customer's order total is not matching the grand total"
  end

  def place(order)
    confirmation_text
    record_processed_order(order)
  end

  def record_processed_order(order)
    @processed_orders << order
  end

end
