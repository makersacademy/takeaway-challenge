class Dish
  attr_reader :price, :name

  def initialize(name = nil, price = nil)
    @name = name
    @price = price
  end
end
