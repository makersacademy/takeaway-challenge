class Dish
  def initialize
    @name = "Dish"
    @price = 0
  end
  attr_reader :name, :price
  def details
    "#{@name} (£#{@price})"
  end
end