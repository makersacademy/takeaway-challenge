# The dish inventory will store a list of all the available dish objects

class DishInventory

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def remove_dish(dish)
    raise "Sorry this item is out of stock" if !dishes.include?(dish)
    dishes.pop
  end

end
