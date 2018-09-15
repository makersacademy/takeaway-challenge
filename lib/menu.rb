require_relative "dish.rb"
class Menu
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add_dish(dish)
    raise "Dish is not currently available" if dish.available == false
    @dishes << dish
  end

  def show_menu
    menu_arr = []
    @dishes.each { |dish| menu_arr << { dish.name.to_sym => dish.price}}
    menu_arr
  end
end