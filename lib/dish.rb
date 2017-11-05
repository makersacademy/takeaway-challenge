# this is a food dish with a name, price and quantity.
class Dish
  attr_accessor :quantity
  attr_reader :name, :price

  def initialize(name, price, quantity = 0)
    @name = name
    @price = price
    @quantity = quantity
  end
end
