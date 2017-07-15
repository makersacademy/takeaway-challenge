# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require_relative '../lib/menu.rb'

menu = Menu.new("Dominos",
"Cheese & Tomato", 6,
"Mighty Meaty", 9,
"Pepperoni Passion", 8,
"Tandoori Hot", 9,
"Vegi Sizzler", 8)

puts "#{menu.name} Menu"
menu.dishes.each do |dish, price|
  print "#{dish}".ljust(25)
  print "#{'%.02f' % price}".rjust(10)
  puts ""
end
