class Dish

  attr_reader :name, :price
  attr_writer :available

  def initialize(name, price)
    @name = name
    @price = price
    @available = true
  end

  def available?
    @available 
  end
  
  def availability
   return available? ? "available" : "unavailable"
  end

end
