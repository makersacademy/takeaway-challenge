require "dish"

class Menu
  attr_reader :dishes

  def initialize(dish_class = Dish)
    @dishes = []
    @dishes << dish_class.new("Lemon chicken", 515, 81, 1)
  end

  def list
    dishes.each { |dish| dish.print_dish }
  end
end
