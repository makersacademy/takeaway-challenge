require_relative 'menu'

class Takeaway

  def take_order(order, order_class = Order)
    order_lines = order.split("\n")
    orders_with_price = order_lines.each { |line| line.split(',') }
    process_order(orders_with_price, order_class)
  end

  def process_order(orders_with_price, order_class)
    price = orders_with_price.pop
    orders = orders_with_price.select { |item| item[0] }
    quantities = orders_with_price.select { |item| item[1] }
    order_class.new(orders, quantities, price)
  end

  # def verify_order?(order)
  #   order.correct?
  # end

end
