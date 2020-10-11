class Order
  attr_reader :order
    
  def initialize
    @order = []
    @total = []
    @total_order = []
  end 
  
  def add(item, price, quantity) 
    @order << { :item => item, :price => price, :quantity => quantity }
  end 

  def total_items
    @order.map { |bill| @total << bill[:price] }
    return @total.sum
  end 
end 
