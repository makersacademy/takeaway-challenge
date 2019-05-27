require './lib/customer.rb'
require 'twilio-ruby'

customer = Customer.new

customer.view_menu

customer.add_to_order("Jasmine Rice", 1)
customer.add_to_order("Egg Noodles", 2)
customer.add_to_order("Chicken Red Thai Curry", 1)
customer.add_to_order("Chicken Red Thai Curry", 1)

customer.place_order(21.50)
