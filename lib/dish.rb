class Dish

  attr_reader :name, :price

  def initialize(name = "Curry",price = 5)
    @name = name
    @price = price
  end

end