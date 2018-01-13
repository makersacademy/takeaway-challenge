#understand how to create a dish
class Dish
  attr_accessor :dish

  def initialize(name, price)
    @name = name
    @price = price
  end
end

#
# require './lib/menu.rb'
# require './lib/dish.rb'
# menu = Menu.new
# dish1 = Dish.new("Cheese board", 2)
# dish2 = Dish.new("Soup", 4)
# dish3 = Dish.new("Rice", 5)
# menu.add_dish(dish1)
# menu.add_dish(dish2)
# menu.add_dish(dish3)
# menu.display
