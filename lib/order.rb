require_relative '../lib/menu.rb'

class Order
  attr_reader :order, :total

  def initialize
    @order = []
    @total = []
  end

#   def view_order
#     dish_count = Hash.new(0)
#     @order.each { |dish| dish_count[dish] += 1 }
#     dish_count.each { |d,c| puts "#{d}x #{c}"}
#     puts "Your total is: £#{@total.inject(0, :+)}"
#   end

end