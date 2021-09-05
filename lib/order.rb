class Order 
  attr_reader :my_order 

  def initialize
    @my_order = []
  end

  def add_dish_to_order(name, quantity)
    @name = name
    @quantity = quantity
    @my_order << { @name => @quantity }
  end
end
