require_relative "../lib/restaurant"
require_relative "../lib/dish"

melvinos = Restaurant.new

roast_beef = Dish.new("Roast Beef", 7.80)
fish_and_chips = Dish.new("Fish and Chips", 8.20)
steak = Dish.new("Steak", 16.00)

melvinos.add_dish(roast_beef)
melvinos.add_dish(fish_and_chips)
melvinos.add_dish(steak)

puts melvinos.menu
