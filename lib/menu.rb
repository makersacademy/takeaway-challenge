require_relative "dish"
require_relative "order"
require "csv"

class Menu

  attr_reader :dishes_list

  def initialize
    @dishes_list = []
  end

  def load_menu(file)
    CSV.foreach(file) do |line|
      dish_name, dish_price = line
      dishes_list << Dish.new(dish_name, dish_price.to_i)
    end
  end

  def add_dish(dish)
    @dishes_list << dish
  end

  def print_dishes(list)
    list.each_with_index do |dish, index|
      print "#{index + 1}.".center(4)
      puts "#{dish.name.ljust(25, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end

end
