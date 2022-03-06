require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def print_menu
    @dishes.each { |dish|
      puts "#{dish.name}...........................#{dish.price}"
      puts "#{dish.availability}"
    }
  end
end

