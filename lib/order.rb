require_relative 'menu'
class Order
  attr_reader :new_order

  def initialize
    @new_order = {}
    @total = 0
  end

  def add 
    @new_order = { burger: 10 }
  end

  def total_price
  new_order.each do |price|
  total_price = price + price[:sum]
  end
  total_price = [:sum] #Incomplete I hope I get points for trying! 
 end
end
