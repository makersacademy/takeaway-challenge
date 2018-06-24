require_relative './order.rb'

class CalculateOrder

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def calculate(order)
    order.each do |key|
      @balance += key[:price]
    end
  end

end
