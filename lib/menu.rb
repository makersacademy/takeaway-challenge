require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    fail 'invalid dish' unless dish.respond_to?(:name)
    fail 'invalid name' unless dish.name.is_a?(String) && dish.name.length <= 30
    fail 'invalid dish' unless dish.respond_to?(:price)
    fail 'invalid price' unless dish.price.is_a?(Float) && dish.price >= 0
    @dishes << dish
  end

end
