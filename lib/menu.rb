require_relative 'dish'

class Menu
  def initialize(dish_class = Dish)
    @dishes = {}
    @dish_class = dish_class
  end
 
  def add_dish(name:,price:)
    dish = @dish_class.new(name,price)
    @dishes[dish.name] = dish.price
  end

  def dishes
    @dishes.dup
  end
end
