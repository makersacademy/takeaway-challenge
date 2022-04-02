=begin

puts "Creating a new menu..."
my_menu = Menu.new


puts "Let's add some dishes to the menu"
wings = my_menu.new_dish("Cauliflower Buffalo Wings", 7)
burger = my_menu.new_dish("Big Bad Burger", 13)
sundae = my_menu.new_dish("Biscoff Sundae", 6)

puts "Let's take a look at the menu"
menu.view

puts "Let's select some dishes for a meal for two"
menu.select("Cauliflower Buffalo Wings", 1)
menu.select("Big Bad Burger", 2)
menu.select("Biscoff Sundae", 1)

puts "Our selections are now in the basket"
basket.view_basket

puts "We can check that the total reflects the selections in the basket"
basket.check_total

puts "Let's complete the order"
basket.complete_order
puts "Check that you have received a confirmation of the order by text"

=end