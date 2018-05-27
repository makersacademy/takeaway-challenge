require './lib/menu'
require './lib/restaurant_app'

menu  = Menu.new
restaurant_app = RestaurantApp.new()

#menu.print_menu
p menu.select_food
p restaurant_app.add_dish("Margherita")
