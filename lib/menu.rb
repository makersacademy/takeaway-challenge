require_relative 'dish'

class Menu

attr_reader :dishes, :dish1, :dish2, :dish3

  def initialize #(dish1 = Dish.new("sushi"), dish2 = Dish.new("pizza"), dish3 = Dish.new("laksa"))
    @dishes = []
  end

  def make_dish(type, price)
    @type = type
    @price = price
    @dish = {type => price}
  end

  def add_dish
    @dishes << @dish
  end

  def remove(dish)
    @dishes.delete(dish)
  end

end
