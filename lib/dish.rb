
# This is a dish to be featured on a menu, it has a name, a description and a price.
class Dish
  attr_reader :name, :description, :price

  def initialize(name, description, price)
    @name = name
    @description = description
    @price = price
  end

end
