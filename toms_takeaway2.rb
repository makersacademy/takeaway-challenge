require './lib/interface.rb'
require './lib/menu.rb'
require './lib/adapter.rb'

ENV['TWILIO_ACCOUNT_SID'] = #Insert your twilio account credentials
ENV['TWILIO_AUTH_TOKEN'] = #Insert your twilio account credentials
ENV['TWILIO_NUMBER'] = #Insert your twilio account credentials
ENV['TEST_NUMBER'] = #Insert the number you wish to contact

TomsTakeaway = Interface.new({})

puts 'Your takeaway can be accessed on the variable - TomsTakeaway'
puts 'Use .show_menu to view menu.'
puts 'Use .new_order to start a new order.'
puts 'Use .order with the item name to add item to order.'
puts 'Use .review_order to view a summary of the order.'
puts 'Use .checkout to checkout.'
puts 'Use .check_mobile_orders to fill any waiting mobile orders'
puts '------------------------------------------------------------'
