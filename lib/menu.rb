require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_new_dish(new_dish = Dish.new(name,price))
    dishes << new_dish
  end

  def print_menu
    dishes.each {|dish| puts dish.print_dish}
  end

  def dish_price(dish_name)
    dishes.each {|dish| return dish.price if dish.name == dish_name}
  end

  def dish_in_menu?(dish_name)
    dishes.each {|dish| return true if dish.name == dish_name}
    false
  end

end