class Dish

  attr_reader :name

  def initialize(name, price)
    @name = name
    @price = price # in pence (integer)
  end

  def price
    @price / 100.0
  end

end