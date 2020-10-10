class Order
  attr_reader :order
  
  def initialize
    @order = []
  end 

  def add(item, price, quantity) 
    @order << {item => item, price => price, quantity => quantity}
  end 
end