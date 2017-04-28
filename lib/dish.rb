class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def present
    { name => price }
  end

end
