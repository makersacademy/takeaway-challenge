# An object storing the name and price of a meal dish
class Dish
  attr_reader :price, :name

  def initialize(name, price)
    @name = name
    @price = price
  end
end
