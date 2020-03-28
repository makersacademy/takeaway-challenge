require_relative 'dish'

class ListOfDishes
  def initialize(dishes)
    raise ArgumentError, 'at least one dish must be specified' if dishes.empty?
    @dishes = dishes
  end

  def see
    @dishes
  end

  def get_dish(dish_name)
    @dishes[dish_name]
  end
end
