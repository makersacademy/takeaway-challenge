class Dish
  attr_reader :name

  def initialize(name, price)
    @name = name
    @price = price_as_integer(price)
  end

  def price
    @price / 100.0
  end

  private

  def price_as_integer(price)
    price.round(2) * 100
  end
end