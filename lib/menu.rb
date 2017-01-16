require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize(dish_class)
    @dishes = []
    @dish_class = dish_class
    default_dishes
  end

  def add_dish(name, price)
    name = @dish_class.new(name, price)
    @dishes << name
  end

  private

  def default_dishes
    chicken_tikka = @dish_class.new('chicken_tikka', 5)
    @dishes << chicken_tikka
    orange_juice = @dish_class.new('orange_juice', 2)
    @dishes << orange_juice
    onion_bhaji = @dish_class.new('onion_bhaji', 3)
    @dishes << onion_bhaji
  end
end
