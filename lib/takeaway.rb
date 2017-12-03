require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize
    @menu = Menu.new
    @order_history = []
  end

  def handle_order(user_order)
    order_output(process_order(take_order(user_order)))
  end

  def take_order(order, order_class = Order)
    order_lines = order.split("\n")
    orders_with_price = order_lines.each { |line| line.split(',') }
    create_order(orders_with_price, order_class)
  end

  def order_output(order)
    raise 'Incorrect Order Received' unless order_correct?(order)
    "Your order is complete! Total: £#{"%.2f" % order.price}, Arriving by: #{order.time}"
  end

  private
  attr_reader :menu

  def process_order(order)
    order.translate(menu)
    order
  end

  def order_correct?(order)
    order.correct?
  end

  def create_order(orders_with_price, order_class)
    price = orders_with_price.pop
    orders = orders_with_price.select { |item| item[0] }
    quantities = orders_with_price.select { |item| item[1] }
    order_class.new(orders, quantities, price)
  end

end
