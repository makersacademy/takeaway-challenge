require_relative "dish.rb"

#Manages the dishes
class Menu

attr_reader :name, :dishes


DEFAULT_NAME = "Best London Curry House"
  def initialize(name = DEFAULT_NAME)
    @name = name
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def delete_dish(dish)
    dishes.delete(dish)
  end

  def show_menu
    dishes.each_with_index {|dish, index| puts "#{index + 1}. #{dish.name} £#{dish.price}"}
  end

end
