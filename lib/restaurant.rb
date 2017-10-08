require_relative './takeaway'


class Restaurant

  def initialize(order, total_price, order_input, price_input)
    @order = order
    @total_price = total_price
    @order_input = order_input
    @price_input = price_input
  end

  def process
    fail "Fail to process due to unmatched price or order" unless order_correct?
  end

  private 

  def order_correct?
    @price_input == @total_price && @order_input == @order
  end

end
