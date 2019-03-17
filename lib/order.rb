class Order 
  attr_reader :bucket

  def initialize
    @bucket = {}
  end
   
  def add(dish, quantity)
    @bucket[dish] = quantity
  end
end
