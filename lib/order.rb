class Order
  
  attr_reader :order
  
  def initialize
    @order = []
  end
  
  def add(item, qty, price)
    @order << { :item => item, :qty => qty, :price => price.to_i }
  end

  def total
    sum = 0
    @order.each { |i| sum += i[:qty] * i[:price] }
    sum
  end
  
end
