class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
    @available = true
  end

  def available?
    @available
  end
end
