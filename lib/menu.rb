require './lib/dish.rb'
require './lib/example_dishes.rb'

class Menu
  attr_reader :dishes

  def initialize(dishes = ExampleDishes::DISH_LIST)
    @dishes = dishes
  end

end
