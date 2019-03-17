class Order 
  attr_reader :bucket, :menu 

  def initialize(menu)
    @bucket = {}
    @menu = menu 
  end
   
  def add(dish, quantity)
    fail 'Not in menu!' if !menu.include(dish)
    @bucket[dish] = quantity
  end
  
end
