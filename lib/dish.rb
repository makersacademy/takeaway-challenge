# Dish class
# instances initiated via menu object
# readable name and price instance variables

class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
