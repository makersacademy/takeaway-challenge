require_relative 'dish'
require_relative 'order'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def save
    file = File.open("menu.csv", "w")
    @dishes.each do |dish|
      menu_item = [dish.name, dish.price]
      csv_line =  menu_item.join(",")
      file.puts csv_line
    end
    file.close
  end
  def load(filename = "menu.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, price = line.chomp.split(",")
      @dishes << Dish.new(name, price)
    end
    file.close
  end
end
