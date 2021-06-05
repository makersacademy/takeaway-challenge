require_relative 'dish'

class Menu
  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def add_dish(dish = Dish.new(name), price)
    @list_of_dishes << { dish: dish, price: price }
  end
  
end
