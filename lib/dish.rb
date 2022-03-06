class Dish
  def initialize(name, price)
    @name = name
    @price = price
  end

  def print
    "The #{@name} costs £#{@price}"
  end
end
