require_relative 'order'
require_relative 'sms_confirm'

class Bill

  attr_reader :total_cost

  def initialize(order = Order.new)
    @order = order
    @total_cost = 0
  end

  def show(order)
    puts "Your total bill is:".center(50)
    puts " --------------------------".center(50)
    order.each do |item|
      puts "#{item[:name]} .......... £#{item[:price]}".center(50)
    end
    puts " --------------------------".center(50)
    puts "The total cost is: £#{@total_cost}".center(50)
  end

  def total(order)
    order.each do |item|
      @total_cost += item[:price].to_i
    end
  end
end
