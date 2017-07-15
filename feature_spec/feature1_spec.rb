# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require_relative '../lib/menu.rb'

dishes = {
  "Cheese & Tomato"   => 6.00,
  "Mighty Meaty"      => 9.00,
  "Pepperoni Passion" => 8.00,
  "Tandoori Hot"      => 9.00,
  "Vegi Sizzler"      => 8.00
}

p menu = Menu.new("Dominos", dishes)

puts "#{menu.name} Menu"
menu.dishes.each do |dish, price|
  print "#{dish}".ljust(25)
  print "#{'%.02f' % price}".rjust(10)
  puts ""
end
