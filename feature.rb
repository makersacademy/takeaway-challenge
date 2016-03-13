require_relative './lib/menu.rb'
require_relative './lib/dish.rb'
require_relative './lib/order.rb'


menu  = Menu.new(Dish)
order = Order.new(menu)
p 'Test 1 #see_dishes exp. 2'
menu.create_dish(:tuna_paste, 4)
menu.create_dish(:steak, 6)
p menu.see_dishes
puts
puts

p 'Test 2 get a list of dishes'
p order.see_menu
p 'Test 2 #place_order output total (40)'
p menu.place_order(:tuna_paste, 10)


p 'Test 3 #place_order again expect higher total(100)'
p menu.place_order(:steak, 10)

p 
