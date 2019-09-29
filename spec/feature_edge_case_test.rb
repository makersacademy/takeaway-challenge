##### EDGE CASES

require_relative "../lib/restaurant"
require_relative "../lib/dish"
require_relative "../lib/order"
require_relative "../lib/sms"

# 1. Restaurant hasn't added any dishes
puts "\nEdge case 1: Restaurant menu is empty"
nada_con_nada = Restaurant.new
puts "> nada_con_nada.menu"
puts nada_con_nada.menu

# 2. User hasn't selected any dishes and tried to place order
puts "\nEdge case 2: User tries to place an empty order"
melvinos = Restaurant.new

roast_beef = Dish.new("Roast Beef", 7.80)
fish_and_chips = Dish.new("Fish and Chips", 8.20)
steak = Dish.new("Steak", 16.00)

melvinos.add_dish(roast_beef)
melvinos.add_dish(fish_and_chips)
melvinos.add_dish(steak)

order = Order.new
puts "\nreviewing order\n> order.review"
puts order.review
puts "\nprint total\n>order.print_total"
puts order.print_total
puts "\nplace order(56.2)"
puts order.place(56.2)
