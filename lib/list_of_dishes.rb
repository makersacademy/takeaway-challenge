require_relative 'dish'

class ListOfDishes
  def initialize(dishes)
    raise ArgumentError, 'at least one dish must be specified' if dishes.empty?

    @dishes = {}
    dishes.each do |dish|
      raise ArgumentError, 'duplicate names in list of dishes' if @dishes[dish.name]
      
      @dishes[dish.name] = dish
    end
  end

  def see
    @dishes
  end

  def get_dish(dish_name)
    @dishes[dish_name]
  end
end
