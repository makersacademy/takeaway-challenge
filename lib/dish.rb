class Dish
  attr_reader :price
  
  def initialize(name, price)
    @name = name
    @price = price
  end

  def view
    { @name => @price }
  end
end
