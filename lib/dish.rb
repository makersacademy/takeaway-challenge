class Dish
  attr_reader :name, :price
  
  def initialize(name, price)
    @name = name
    @price = price
  end

  def print
    "The #{@name} costs £#{@price}"
  end
end
