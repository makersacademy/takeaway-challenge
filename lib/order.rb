
require_relative './messenger'

class OrderTotalError < StandardError; end

# This will be populated with the customer's menu choices and will contain the order total.
class Order
  attr_reader :order, :total

  @@order_count = 0

  def initialize
    @order = []
    @total = 0
    @messenger = Messenger.new
    @@order_count += 1
  end

  def add_to_order(dish, quantity)
    @order << { dish: dish, quantity: quantity }
  end

  def order_number
    @@order_count
  end

  def finalise(expected_order_total)
    raise(OrderTotalError) if expected_order_total != @total
  end

end
