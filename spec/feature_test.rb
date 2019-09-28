require_relative "../lib/restaurant"
require_relative "../lib/dish"
require_relative "../lib/order"

# Initializations
melvinos = Restaurant.new

roast_beef = Dish.new("Roast Beef", 7.80)
fish_and_chips = Dish.new("Fish and Chips", 8.20)
steak = Dish.new("Steak", 16.00)

melvinos.add_dish(roast_beef)
melvinos.add_dish(fish_and_chips)
melvinos.add_dish(steak)

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
puts melvinos.menu

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

order = Order.new

puts "\nadding to order"
order.add(roast_beef, 2)
order.add(steak, 1)
order.add(fish_and_chips, 3)

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

puts "\nreviewing order"
puts order.review

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

puts "\nprint total"
puts order.print_total

puts "\nplace order(56.2)"
puts order.place(56.2)
