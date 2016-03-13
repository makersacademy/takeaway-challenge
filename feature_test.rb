require './lib/menu.rb'
require './lib/takeaway.rb'
require './lib/order.rb'
require './lib/dish.rb'
require './lib/messenger.rb'

menu = Menu.new
curry = Dish.new(name: "Curry", price: 7)
doughnut = Dish.new(name: "Doughnut", price: 2)
menu.add(curry)
menu.add(doughnut)
doughnuts_and_curry_house = Takeaway.new(menu)
doughnuts_and_curry_house.select_item("not_food")
doughnuts_and_curry_house.select_item(doughnut)
doughnuts_and_curry_house.confirm_order(1)
doughnuts_and_curry_house.confirm_order(2)
