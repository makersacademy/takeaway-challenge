class Dish
  attr_reader :name, :price, :id, :quantity
  
  def initialize(name, price, id, quantity = 1)
    @name = name
    @price = price
    @id = id
    @quantity = quantity
  end

  def print_dish
    "#{id}: #{name} ------- #{price}"
  end
end
