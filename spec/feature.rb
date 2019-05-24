require './lib/customer.rb'

customer = Customer.new

customer.view_menu

customer.add_to_order("Jasmine Rice", 1)
