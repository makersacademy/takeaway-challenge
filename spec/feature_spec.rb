# require 'menu'
# require 'restaurant'
require 'takeaway'

menu11 = Menu.new
menu11.import_menu({ "pizza" => 6, "kebab" => 5 })
pizza = Restaurant.new("Pizza", menu11)
p pizza.display_menu
p pizza
p take = Takeaway.new(pizza, '07767892911')
p take.select_dish("pizza")
p take.select_dish("kebab")
p take.select_dish("pizza", 2)
p take.show_basket
# p take.checkout(1234)
# Already tested and works (when number was inputted correctly - now changed)
# hashed out to avoid texts being sent
