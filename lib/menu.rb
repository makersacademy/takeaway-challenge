require 'csv'
require_relative 'dish'

class Menu

  attr_accessor :dish_list

  def initialize(dish_list = [])
    @dish_list = dish_list
    load_file_with_dishes
  end

  def load_file_with_dishes
    file = File.open("./lib/menu.csv", "r")
    file.readlines.each do |line|
      name, price = line.chomp.split(",")
      @dish_list << Dish.new(name, price)
    end
    file.close
  end

  def read_menu
    @dish_list.each do |val|
      puts "#{val.name}--#{val.price}"
    end
  end

  def add_dish(dish)
    @dish_list << dish
    CSV.open("./lib/menu.csv", "ab") do |csv|
      csv << [dish.name, dish.price]
    end
  end

end
