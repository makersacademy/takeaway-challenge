require 'dish'

class Menu

  attr_reader :dishes

  MAX_NAME_LENGTH = 30

  def initialize
    @dishes = [Dish.new("Chicken Teriyaki", 5),
               Dish.new("Ramen", 7),
               Dish.new("Pad Thai", 5),
               Dish.new("Chocolate ice cream", 2)]
  end

  def show
    output = ''
    @dishes.each {|dish| output += "#{dish.name.ljust(MAX_NAME_LENGTH,' ')} £#{dish.price}\n"}
    output
  end
end
