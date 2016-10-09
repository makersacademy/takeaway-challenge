require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def display
    @dishes.each do |dish|
    puts "#{dish.name}: £#{dish.price}"
    end
  end

end
