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

  def check_bal(order_balance)
    if @balance == order_balance
      true
    else
      false
    end

  end


end
