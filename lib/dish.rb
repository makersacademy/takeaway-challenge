class Dish
  attr_reader :name, :price, :description
  def initialize(name, price, description = nil)
    @name = name
    @price = price
    @description = description
  end
end
