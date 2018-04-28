require './lib/dish.rb'
require './lib/menu.rb'

def dish1
  dish1 = Dish.new(name:'Steak', price: 25)
end

# def new_menu
#   menu = Menu.new
#   dish1 = Dish.new(name: 'Steak', price: 25)
#   dish2 = Dish.new(name: 'Chips', price: 8)
#   dish3 = Dish.new(name: 'Caesar Salad', price: 9)
#   menu.add(dish1)
# end

p dish1
# p new_menu

# irb -r './spec/feature_tests.rb'
