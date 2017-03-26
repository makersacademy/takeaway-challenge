# contains a list of all available dishes for selection

require './lib/dish.rb'
require './lib/cart.rb'

class Menu

  def initialize
    @list = []
  end

  attr_reader :list

  def add(dish)
    list.push(dish)
  end

  def choice(number)
    dish = list[number - 1]
    return dish
  end

  def print_menu
    count = 1
    puts "----------"
    list.each do |dish|
      puts "#{count}. #{dish.name}, £#{dish.price}"
      count += 1
    end
    puts "----------"
  end

end
