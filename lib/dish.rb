class Dish

  attr_reader :name, :price
  def initialize name, price
    @name = name
    @price = price
  end

  def self.create dish_name, dish_price
    Dish.new dish_name, dish_price
  end

end