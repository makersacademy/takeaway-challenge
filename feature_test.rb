require './lib/dish.rb'
require './lib/menu.rb'

menu = Menu.new

curry = Dish.new(name: "Curry", price: 1)
chili = Dish.new(name: "Chili", price: 2)
salad = Dish.new(name: "Salad", price: 4)
chips = Dish.new(name: "Chips", price: 8)

menu.add(curry)
menu.add(chili)
menu.add(salad)
menu.add(chips)

# customer sees list of dishes with prices
menu.dishes.each.with_index do |dish, i|
  puts "#{i+1}. #{dish.name}: price £#{dish.price}"
end

# customer selects dishes and quantity

order.add("curry", 2)
order.add("Chips", 1)
order.finalise

puts "Order total: #{order.total}"
