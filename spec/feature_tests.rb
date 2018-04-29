require './lib/dish.rb'
require './lib/menu.rb'
require './lib/basket.rb'

def new_menu
  dish1 = Dish.new(name: 'Steak', price: 25)
  dish2 = Dish.new(name: 'Chips', price: 8)
  dish3 = Dish.new(name: 'Caesar Salad', price: 9)
  dish4 = Dish.new(name: 'Ice cream', price: 3)
  dish1 = dish1.set_details
  dish2 = dish2.set_details
  dish3 = dish3.set_details
  dish4 = dish4.set_details
  menu = Menu.new
  menu.add_item(dish1)
  menu.add_item(dish2)
  menu.add_item(dish3)
  menu.add_item(dish4)
  menu.item_list
  menu.display
end

def new_basket
  new_menu
  basket = Basket.new
  basket.add_dish(dish: 'Steak', price: 25, quantity: 1)
  basket.add_dish(dish: 'Chips', price: 8, quantity: 2)
  basket.add_dish(dish: 'Caesar Salad', price: 9, quantity: 3)
  basket.display_summary
  basket.total_cost
  basket.display_total
end

# p new_menu
p new_basket

# irb -r './spec/feature_tests.rb'
