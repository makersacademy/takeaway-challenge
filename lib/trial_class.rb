require_relative 'customer'
require_relative 'takeaway'

puts "What is your name?"
name = gets.chomp
puts "What is your phone number?"
number = gets.chomp

# Set up customer, takeaway and add customer details
customer = Customer.new(name, number)
takeaway = Takeaway.new
takeaway.add_customer_details(customer)

puts takeaway.show_menu
puts "What would you like to order?"
item = gets.chomp
