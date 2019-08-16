class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def add_dish(dish)
    @dishes << dish
  end
end
