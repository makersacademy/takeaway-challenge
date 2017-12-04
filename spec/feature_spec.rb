require "./lib/restaurant"

restaurant = Restaurant.new

# view menu
p restaurant.print_menu
# place order
p order = restaurant.place_order
# add to order
p order.add("Korma", 3)
p order.add("Tikka Masala", 2)
# remove from order
p order.remove("Tikka Masala")
# basket summary
p order.basket_summary
# total
p order.total
# check totals
p order.check_totals
p order.print_total
# confirm order
#p restaurant.confirm_order
