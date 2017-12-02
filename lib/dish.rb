class Dish
  attr_reader :name, :description, :price

  def initialize(name, description, price)
    @name = name
    @description = description
    @price = price
  end

end
