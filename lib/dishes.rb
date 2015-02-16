class Dish

  attr_reader :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    @name
  end

end