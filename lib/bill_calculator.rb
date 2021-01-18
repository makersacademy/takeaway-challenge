require_relative 'menu'
require 'BigDecimal'

class BillCalculator

  attr_reader :cost

  def initialize
    @cost = 0
    @menu = Menu.new
  end

  def bill(order)
    calculate(order)
    puts "Total order cost is £#{@cost.to_f}"
  end

  def calculate(order)
    order.each do |item|
      @cost += BigDecimal("#{@menu.dishes[item]}")
    end
  end

end
