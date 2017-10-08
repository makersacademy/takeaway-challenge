require './lib/object_list.rb'

class Menu
  attr_reader :dishes_list

  def initialize(dishes_list = ObjectList.new)
    @dishes_list = dishes_list
  end

  def add_dish(dish)
    # fail 'Menu already contains dish' if dish_found? dish
    @dishes_list.add dish
  end

  def remove_dish(dish)
    # fail 'Dish not found' unless dish_found? dish
    @dishes_list.remove dish
  end

  def view_menu
    @dishes_list.to_string
  end

end
