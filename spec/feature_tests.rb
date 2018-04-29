require './lib/dish.rb'
require './lib/menu.rb'
require './lib/basket.rb'

def new_menu
  dish1 = Dish.new('Steak', 25)
  dish2 = Dish.new('Chips', 8)
  dish3 = Dish.new('Caesar Salad', 9)
  dish4 = Dish.new('Ice cream', 3)
  menu = Menu.new
  menu.add(dish1)
  menu.add(dish2)
  menu.add(dish3)
  menu.add(dish4)
  menu.display
end

# def new_basket
#   new_menu
#   basket = Basket.new
#   basket.add_dish(dish: 'Steak', price: 25, quantity: 1)
#   basket.add_dish(dish: 'Chips', price: 8, quantity: 2)
#   basket.add_dish(dish: 'Caesar Salad', price: 9, quantity: 3)
#   basket.display_summary
#   basket.total_cost
#   basket.display_total
# end

p new_menu
# p new_basket

# irb -r './spec/feature_tests.rb'
