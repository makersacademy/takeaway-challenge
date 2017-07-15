# describe "feature tests" do
#
# end

require './lib/dish.rb'
require './lib/takeaway.rb'
require './lib/restaurant.rb'
require './lib/menu.rb'

d1 = Dish.new("Burrito", 5)
d2 = Dish.new("Pizza", 10)
d3 = Dish.new("Burger", 15)

dl = [d1, d2, d3]
r = Restaurant.new(Menu.new(dl))
r.show_menu
r.order_dish("Burrito")
r.order_dish("Burritoes")
