class Order
  attr_reader :trolley
  
  def initialize
    @trolley = {}
  end

  def add_dish(dish, quantity)
    @trolley[dish] = quantity
  end
  
end
