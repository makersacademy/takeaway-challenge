require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/customer.rb'
require './lib/sms.rb'
require 'rubygems'
require 'twilio-ruby'

requests = []
customers = []
customers << Customer.new(name: "Joe Bloggs", mobile:ENV['MY_NUMBER'])

menu = Menu.new

menu.add Dish.new(name: "Curry", price: 16)
menu.add Dish.new(name: "Chili", price: 2)
menu.add Dish.new(name: "Salad", price: 4)
menu.add Dish.new(name: "Chips", price: 8)

sms_client = Twilio::REST::Client.new ENV['TWILIO_SID'],ENV['TWILIO_AUTH_TOKEN']
sms_number = ENV['TWILIO_NUMBER']
sms = Sms.new(client: sms_client, number: sms_number)

requests.concat(sms.get_messages)

requests.each do |request|
  customer_index = customers.index {|customer| customer.mobile == request.from}
  customer = customers[customer_index]

  order = Order.new(customer: customer)
  request_ary = request.body.split(',')
  request_ary.each do |item|
    line = item.split(' ')
    order.add(menu.dishes[line[0].capitalize],line[1].to_i)
  end
  time = (Time.now + (60*60)).strftime("%I:%M%p")
  order.finalise(customer: customer, delivery_time: time, channel: sms)
end

exit

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
