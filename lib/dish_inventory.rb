# The dish inventory will store a list of all the available dish objects

class DishInventory

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

end
