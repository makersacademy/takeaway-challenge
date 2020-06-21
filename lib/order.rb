class Order
  
  attr_reader :order
  
  def initialize
    @order = []
  end
  
  def add(item, qty, price)
    @order << { :item => item, :qty => qty, :price => price.to_i }
  end

  def total
    @order.sum { |i| i[:qty] * i[:price] }
  end
  
end
