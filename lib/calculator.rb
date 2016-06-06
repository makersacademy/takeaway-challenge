require_relative 'checkout'

class Calculator
  def initialize(order)
    @order = order
  end

  def summerize
    checkout = Checkout.new(@order, @total_price)
    checkout.order_summery
  end

  def sum_price
    @total_price = access_menu.map { |k, v| v * @order[k] if @order.key? k }.compact.inject(:+)
  end

  private

  def access_menu
    Menu.new.show
  end
end
