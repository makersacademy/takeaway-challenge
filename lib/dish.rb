class Dish
  attr_reader :name, :price
  def initialize(dish_info)
    @name = dish_info[:name]
    @price = dish_info[:price]
  end
end
