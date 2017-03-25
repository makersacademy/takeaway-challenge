# contains information on the name and price of each dish

class Dish

  def initialize(name, price)
    @name = name
    @price = price
  end

  attr_reader :name, :price
end
