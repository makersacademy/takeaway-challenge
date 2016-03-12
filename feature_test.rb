require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/customer.rb'

menu = Menu.new

curry = Dish.new(name: "Curry", price: 16)
chili = Dish.new(name: "Chili", price: 2)
salad = Dish.new(name: "Salad", price: 4)
chips = Dish.new(name: "Chips", price: 8)

menu.add(curry)
menu.add(chili)
menu.add(salad)
menu.add(chips)


# customer sees list of dishes with prices
puts "MENU"
puts "===="
menu.dishes.each do |name, dish|
  puts "#{name}: price £#{dish.price}"
end

puts
# create new order for customer
customer = Customer.new(name: "Joe Bloggs", mobile:"01234 567890")

order = Order.new(customer: customer)

# customer selects dishes and quantity

order.add(menu.dishes["Curry"], 2)
order.add(menu.dishes["Chips"], 3)

puts "ORDER"
puts "====="
order.items.each do |item|
  puts "#{item.dish} x #{item.qty}: £#{item.total}"
end

puts "Order subtotal: £#{order.total}"

exit
order.finalise

puts "Order total: #{order.total}"
