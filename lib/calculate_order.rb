require_relative './order.rb'

class CalculateOrder

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def calculate(order)
    order.each do |key|
      @balance += key[:price]
    end
  end

  def compare(order_balance)
    @balance == order_balance
  end

end
