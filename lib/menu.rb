# understands how to display a menu
require_relative 'dish'

class Menu
  attr_reader :dish, :dishes, :name, :price

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dish = dish
    @dishes << dish
  end

  def display
    @dishes.each_with_index do |dish, index|
      puts "#{index} = #{dish}"
    end
  end
  
end
