class Dish

  DEFAULT_PRICE = 10.0

  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end

end