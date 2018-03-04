# Dish class definition
# This class is responsible for creating a dish object to store individual
# dishes and their pricing. Menu class adds these to it's menu

class Dish
  attr_reader :name, :price
  # initialises dish object with name and price
  def initialize(name, price)
    @name = name
    @price = price
  end
end
