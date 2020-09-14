require_relative 'dish'

class Menu
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add_dish(dish_object)
    @dishes << dish_object
  end 

  def read_menu
    @dishes.each do |dish_object|
      puts "Dish: #{dish_object.name} Price: £#{dish_object.price}"
    end
  end
end
