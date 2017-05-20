class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def print
    "#{@name}, Price: $#{@price}"
  end

end
