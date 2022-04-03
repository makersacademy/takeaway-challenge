# Creates a dish with a price.

class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
