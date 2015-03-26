class Dish

  attr_accessor :name, :price

  def initialize(name_of_dish, price = 4)
    @name = name_of_dish
    @price = price
  end

end