# program that displays menu of items

require './lib/menu.rb'
require './lib/dish.rb'
require './lib/cart.rb'
require './lib/order.rb'
require './lib/delivery_time.rb'
require './lib/info.rb'

cart = Cart.new
menu = Menu.new
menu.add(Dish.new("Extra Hot Vindaloo", 8))
menu.add(Dish.new("Mystery Meat Kebab", 7))
menu.add(Dish.new("Genetically Modified Fried Chicken", 9))

puts "Welcome to Jukes' Late Night Takeaway Emporium!"
puts "------------------"
puts "We have a lovely selection of food you will definitely regret ordering tomorrow."
menu.print_menu
puts "Please choose the number of the meal you would like:"
dish_selection = gets.chomp.to_i
dish_number = menu.choice(dish_selection)
puts "Now please select the quantity you would like:"
quantity_selection = gets.chomp.to_i
cart.add_to_basket(dish_number, quantity_selection)
puts "------------------"
puts "Thank you! Are you ready to check out?"
puts "Y/N"
checkout = gets.chomp.upcase!
puts "You're too drunk to type. It's time to check out." if checkout == "N"
puts "Thank you."
order = cart.checkout
order.confirm
puts "Do you want it delivered now?"
puts "Y/N"
delivery = gets.chomp.upcase!
puts "Well, you can come and pick it up then. Good luck finding us!" if delivery =="N"
order.send if delivery == "Y"
puts "Thank you for your valued custom."



# puts "You can barely stand up, let alone do math. But if you say so..," if confirm == "N"
# oder
