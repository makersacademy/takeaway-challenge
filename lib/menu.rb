require 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def list_dishes
    @dishes.each_with_index do
      |dish, index| puts "#{index + 1}: #{dish.name}, #{dish.description}, £#{dish.price}"
    end
  end

end
