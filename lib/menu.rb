require_relative 'dish'

class Menu

  def initialize
    @dishes = []
  end

  def add_new_dish(new_dish = Dish.new(name,price))
    dishes << new_dish
  end

  def print_menu
    dishes.each {|d| puts "#{d.name}: $#{d.price}"}
  end

  def dish_price(dish_name)
    dishes.each {|d| return d.price if d.name == dish_name}
  end

  def dish_in_menu?(dish_name)
    dishes.each {|d| return true if d.name == dish_name}
    false
  end

  private

  attr_reader :dishes

end