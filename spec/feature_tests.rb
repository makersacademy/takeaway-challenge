require './lib/dish.rb'
require './lib/menu.rb'

def new_menu
  dish1 = Dish.new(name: 'Steak', price: 25)
  dish2 = Dish.new(name: 'Chips', price: 8)
  dish3 = Dish.new(name: 'Caesar Salad', price: 9)
  dish1 = dish1.set_details
  dish2 = dish2.set_details
  dish3 = dish3.set_details
  menu = Menu.new
  menu.add_item(dish1)
  menu.add_item(dish2)
  menu.add_item(dish3)
  menu.item_list
  menu.display
end

p new_menu

# irb -r './spec/feature_tests.rb'
