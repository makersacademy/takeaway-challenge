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
puts
puts

p 'Test 3 #place_order'
order.place_order(:tuna_paste, 10)
puts
puts

p 'Test 4 place a second order and get the order summary'
order.place_order(:steak, 10)
p order.summary
puts puts

p 'Test 5 should give me the total and the summary'
p order.total