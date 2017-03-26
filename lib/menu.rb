require_relative 'dish'

class Menu
  #loads a list of dishes from a CSV file, and can print a legible list of these dishes.

  attr_reader :dishes

def initialize(filename)
  @dishes = {}
  key = 1
  opened_menu_file = File.open(filename, 'r')
  opened_menu_file.readlines.each do |line|
    name, price = line.chomp.split(',')
    dish = Dish.new(name,price)
    @dishes[key] = dish
    key += 1
  end
opened_menu_file.close
end

def list_of_dishes
  @dishes.each do |x,y|
    puts "#{x}.#{y.name}".ljust(20) + "#{y.price}".rjust(20)
  end
end

end
