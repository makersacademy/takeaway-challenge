require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/customer.rb'
require './lib/sms.rb'
require 'rubygems'
require 'twilio-ruby'

sms_client = Twilio::REST::Client.new ENV['TWILIO_SID'],ENV['TWILIO_AUTH_TOKEN']
sms_number = ENV['TWILIO_NUMBER']
sms = Sms.new(client: sms_client, number: sms_number)

p sms.get_messages

exit

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
customer = Customer.new(name: "Joe Bloggs", mobile:ENV['MY_NUMBER'])
order = Order.new(customer: customer)

# customer selects dishes and quantity, reviews, and sees total
order.add(menu.dishes["Curry"], 2)
order.add(menu.dishes["Chips"], 3)

puts "ORDER"
puts "====="
order.items.each do |item|
  puts "#{item.dish} x #{item.qty}: £#{item.total}"
end

puts "Order subtotal: £#{order.total}"


exit
# send sms confirmation to customer


time = (Time.now + (60*60)).strftime("%I:%M%p")

order.finalise(customer: customer, delivery_time: time, channel: sms)
