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
unserved_dish = Dish.new("FREE HAGGIS", 0)

dl = [d1, d2, d3]
r = Restaurant.new(Menu.new(dl), Takeaway.new)
r.show_menu
puts
o = [d1, d2, unserved_dish]
r.take_order(o, 15)
