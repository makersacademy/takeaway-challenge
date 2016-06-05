require_relative 'checkout'

class Calculator
  def initialize(order)
    @order = order
  end

  def summerize
    checkout = Checkout.new(@order, @total_price)
    checkout.order_summery
  end

  def sum_quantity
    @quantity = @order.values.inject(:+) if @order
  end

  def sum_price
    @total_price = Menu.new.show.map { |k, v| v * @order[k] if @order.key? k }.compact.inject(:+)
    # total_price = menu.map { |k, v| v * order[k] if order.key? k }
  end
end
