# The dish inventory will store a list of all the available dish objects
require_relative 'dish'

class DishInventory

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def remove_dish(dish)
    raise "Sorry the inventory is empty" if dishes.empty?
    raise "Sorry this item is out of stock" if !dishes.include?(dish)
    dishes.delete(dish)
  end

end
