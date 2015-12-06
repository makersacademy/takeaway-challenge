require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [
    Dish.new('Satay', 4.50),
    Dish.new('Spring rolls', 3.00),
    Dish.new('Tom yum soup', 4.90)
    ]
  end

  def get_dish(food)
    dishes.each { |dish| return dish if dish.name == food }
    fail 'Sorry we don\'t have that on our menu'
  end

  def add(dish)
    @dishes << dish
  end

  def remove(dish_name)
    @dishes.delete(get_dish(dish_name))
  end
end
