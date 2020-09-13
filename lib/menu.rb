require_relative 'dish'

class Menu
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def addDish(dish_object)
    @dishes << dish_object
  end 

  def readMenu
    @dishes.each do |dish_object|
      return "Dish: #{dish_object.name} Price: £#{dish_object.price}"
    end
  end
end
