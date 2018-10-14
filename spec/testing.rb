require "./lib/restaurant"
require "./lib/item"
require "./lib/order"
require "./lib/menu"

burger = Item.new("Burger", 6)
chips = Item.new("Chips", 4)
coke = Item.new("Coke", 2)
restaurant = Restaurant.new(burger, chips, coke)
