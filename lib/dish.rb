# Creating a dish name, price and optional description

class Dish

  attr_reader :name, :price, :description

  def initialize(name, price, description = '-')
    @name = name
    @price = price
    @description = description
  end
  
end
