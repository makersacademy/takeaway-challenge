require_relative 'dish'
require 'csv'

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

# Allows adding of menu items in bulk
  def add_menu(filename = 'menu.csv')
    csv_menu = File.open(filename, 'r')
    csv_menu.readlines.each do |l|
      arr = l.chomp.split(',')
      @dishes << Dish.new(arr[0].to_sym, arr[1].to_f)
    end
  csv_menu.close
  end

end
