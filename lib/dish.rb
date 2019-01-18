# Initializes with name and price and can forward these
class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name, @price = name, price
  end
end
