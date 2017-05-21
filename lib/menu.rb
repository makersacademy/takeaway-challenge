require_relative './dish.rb'

class Menu

  DEFAULT_DISHES = "mexican_dishes.csv"

def initialize
  @dishes = []
end

def show_menu
  load_menu
  @dishes
end

private

def load_menu(filename = DEFAULT_DISHES)
  file = File.open(filename,"r")
  File.foreach(file) do |line|
    name, price, description = line.chomp.split(',')
    @dishes << Dish.new(name, price, description)
  end
end

end
