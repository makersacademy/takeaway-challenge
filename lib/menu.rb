require_relative 'dish'

class Menu

attr :list

def initialize
  @dish_1 = Dish.new("Pizza", 6)
  @dish_2 = Dish.new("Burger", 7)
  @list = []
  @list << @dish_1
  @list << @dish_2

end

def display
  @list
end


end
