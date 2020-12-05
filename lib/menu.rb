require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize(dish = Dish)
    @dish = dish
    @dishes = []
  end

  def add_dish(name, price)
    @dishes << @dish.new(name, price)
  end

end