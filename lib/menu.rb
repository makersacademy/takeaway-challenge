class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def add_dish(dish)
    fail 'Menu already contains dish' if @dishes.include?(dish)
    @dishes << dish
  end

  def remove_dish(dish)
    @dishes.delete dish
  end
end
