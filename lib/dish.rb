class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def printed
    "#{@name}, Price: $#{@price}"
  end

end
