class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def add_dish(dish)
    fail 'Menu already contains dish' if dish_found?(dish)
    @dishes << dish
  end

  def remove_dish(dish)
    fail 'Dish not found' unless dish_found?(dish)
    @dishes.delete dish
  end

  private
  
  def dish_found?(dish)
    @dishes.include?(dish)
  end
end
