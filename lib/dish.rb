class Dish
  attr_reader :name, :price, :available
  def initialize(name, price, available)
    @name = name
    @price = price
    @available = available
  end

  def pretty_format
    "#{@name} £#{@price}"
  end
end
