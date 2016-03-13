class Dish

  attr_reader :price

  def initialize(name: name, price: price)
    @nam = name
    @price = price
  end

  def name
    @nam.dup
  end

end
