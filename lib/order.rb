require_relative 'choice'
class Order
  attr_reader :order
  def initialize
    @order = []
  end

  def add(choice = Choice, quantity = 0)
    @order << { choice: choice, quantity: quantity }
  end

  def show
    @order.each.map { |item|
      item[:choice].str + " : #{item[:quantity]}"
    }.join("\n")
  end

  def total
    if @order.length != 0
      @order.each.map { |item| item[:choice].price * item[:quantity] }.reduce(:+)
    else
      0
    end
  end
end
