require_relative 'dish'

class Menu

  attr_reader :list_of_dishes

def initialize
  @list_of_dishes = []
end

def load(filename)
opened_menu_file = File.open(filename, 'r')
opened_menu_file.readlines.each do |line|
  name, price = line.chomp.split(',')
  dish = Dish.new(name,price)
  @list_of_dishes << dish
end
opened_menu_file.close
end


end 
