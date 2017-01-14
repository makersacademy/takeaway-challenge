require_relative 'dish'

class Restaurant

  attr_reader :dishes

  def initialize
    @dishes = []
    default_dishes
  end

  # def dishes
  #   @dishes.dup
  # end

  def add_dish(name, price)
    name = Dish.new(name, price)
    @dishes << name
  end

  def default_dishes
    chicken_tikka = Dish.new("chicken_tikka", 5)
    @dishes << chicken_tikka
    orange_juice = Dish.new("orange_juice", 2)
    @dishes << orange_juice
    onion_bhaji = Dish.new("onion_bhaji", 3)
    @dishes << onion_bhaji
  end

end
