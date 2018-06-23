require_relative './order.rb'

class CalculateOrder

  attr_reader :order_total

  def initialize
    @order_total = 0
  end

  def calculate(order)
    order.each do |key|
      @order_total += key[:price]
    end
  end

end
