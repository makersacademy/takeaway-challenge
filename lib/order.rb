class Order
  attr_accessor :dish
  attr_reader :quantity

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
    combined_order = {}
  end

  def add_to_order
    
  end
end