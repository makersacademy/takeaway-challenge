require_relative 'dish.rb'
require_relative 'lookup.rb'

class Menu
  attr_accessor :available_dishes
  attr_reader :lookup
  def initialize
    @available_dishes = []
    @lookup = LookUp.new(@available_dishes)
  end
  def add_dish(dish)
    raise(TypeError, "expecting Dish class object") unless dish.is_a?(Dish)
    @available_dishes << dish
  end
end
