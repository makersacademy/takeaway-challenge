require_relative 'menu'
require_relative 'order'
require_relative 'sms_handler'

class Takeaway
  attr_accessor :order_history, :menu

  def initialize
    @menu = Menu.new
    @order_history = []
  end

  def order_process(user_order, order_class = Order, handler_class = SMSHandler)
    order = handle_order(user_order, order_class)
    send_confirmation(order, handler_class)
  end

  def send_confirmation(order, handler_class = SMSHandler)
    handler_class.new.send_confirmation(order)
  end

  def handle_order(user_order, order_class = Order)
    order = process_order(take_order(user_order, order_class))
    order_history << order
    p order
    order_output(order)
  end

  def take_order(order, order_class)
    order_lines = order.split(" ")
    p order_lines
    orders_with_price = order_lines.map { |line| line.split(',') }
    p orders_with_price
    create_order(orders_with_price, order_class)
  end

  def order_output(order)
    raise 'Incorrect Order Received' unless order_correct?(order)
    "Your order is complete! Total: £#{"%.2f" % order.price}, Arriving by: #{order.time}"
  end

  private

  def process_order(order)
    order.translate(menu)
    order
  end

  def order_correct?(order)
    order.correct?
  end

  def create_order(orders_with_price, order_class)
    price = orders_with_price.pop[0].to_i
    orders = orders_with_price.map { |item| item[0].to_i }
    p orders
    quantities = orders_with_price.map { |item| item[1].to_i }
    order_class.new(orders, quantities, price)
  end

end
