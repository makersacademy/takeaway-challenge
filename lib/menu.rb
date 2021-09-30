require './lib/dish'

class Menu

  attr_reader :dishes

 DISHES = [
    Dish.new('Mushroom Pizza', 9),
    Dish.new('American Hot Pizza', 11.5),
    Dish.new('Salsiaccia Pizza', 10.5),
    Dish.new('Truffle Pizza', 11),
    Dish.new('Chorizo Arancini', 6.5),
    Dish.new('Veg Arancini', 5.5),
    Dish.new('Tiramusi', 5),
    Dish.new('Peroni', 3),
    Dish.new('Nastro Azzuro', 3)
  ].freeze

  def initialize
    @dishes = DISHES
  end

  def list
    @dishes.each do |dish|
      puts "#{dish.name} -- £#{dish.price}"
    end
  end


end