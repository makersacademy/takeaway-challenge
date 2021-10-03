class Dish
  attr_reader :price, :name
  def initialize(name, price)
    @name = name
    @price = price
  end
end
