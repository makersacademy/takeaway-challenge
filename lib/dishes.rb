class Dish
  # name and price of each dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
