class Order
  attr_reader :order
  
  def initialize
    @order = []
  end 

  def add(dish, price, quantity) 
    @order << { dish => dish, price => price, quantity => quantity }
  end 
end
