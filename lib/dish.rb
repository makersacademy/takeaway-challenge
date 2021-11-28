class Dish

  attr_reader :names, :price

  def initialize(name = "Curry",price = 5)
    @names = name
    @price = price
  end

end