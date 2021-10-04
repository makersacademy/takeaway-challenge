require './docs/dish'

class Menu
  attr_reader :dish_class, :menu_list

  def initialize(dish_class = Dish)
    @menu_list = []
    @dish_class = dish_class
  end

  def load
    file = File.open("menu_data.csv", "r")
    file.readlines.each do |line|
      dish_name, dish_price = line.chomp.split(', ')
      @menu_list << { dish_name: dish_name, dish_price: dish_price.to_i }
    end
    file.close
  end

  def add(dish_name, dish_price)
    dish_entry = @dish_class.new(dish_name, dish_price).dish_entry
    @menu_list << dish_entry
  end

  def save
    # open the file for writing
    file = File.open("menu_data.csv", "w")
    # iterate over the array of dishes
    @menu_list.each do |dish|
      dish_info = [dish[:dish_name], dish[:dish_price]]
      csv_line = dish_info.join(', ')
      file.puts csv_line
    end
    file.close
  end

  def print
    @menu_list
  end
 
end
