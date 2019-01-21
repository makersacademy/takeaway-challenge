require_relative 'dish'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = []
  end


  def add(dish_name, price = 0, dish = Dish)
    @menu_list.push(dish.new(dish_name, price))
  end
end
