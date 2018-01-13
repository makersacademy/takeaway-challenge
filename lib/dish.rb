# understands how to create a dish
class Dish

  def initialize(name, price)
    @name = name
    @price = price
  end
  def to_s
    "Menu item: #{@name}: £#{@price}"
  end
end
