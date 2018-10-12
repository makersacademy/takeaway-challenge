# This class holds types of dishes found at the resturaunt

class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
