require_relative 'text'

class Order
  attr_reader :sum
   def initialize(list, order_quantities, my_total)
     @list = list
     @order_quantities = order_quantities
     @my_total = my_total
   end

  def total
    @sum = 0
    @list.each{|food, price| @sum += price.to_i * @order_quantities[food].to_i }
    if match_total
      text = Text.new
      text.message
    end
    @sum
  end

  def match_total
  raise "Your sum is not correct!" if @sum != @my_total
  true
  end
end
