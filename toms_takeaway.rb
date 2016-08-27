require './lib/interface.rb'
require './lib/menu.rb'
require './lib/adapter.rb'

ENV['TWILIO_ACCOUNT_SID'] = #Find in your Twilio Account Online
ENV['TWILIO_AUTH_TOKEN'] = #Find in your Twilio Account Online
ENV['TWILIO_NUMBER'] = #Find in your Twilio Account Online
ENV['TEST_NUMBER'] = #The number you want to send confirmation. Need to verify on Twilio

TomsTakeaway = Interface.new({})

puts 'Your takeaway can be accessed on the variable - TomsTakeaway'
puts 'Use .show_menu to view menu.'
puts 'Use .new_order to start a new order.'
puts 'Use .order with the item name to add item to order.'
puts 'Use .review_order to view a summary of the order.'
puts 'Use .checkout to checkout.'
puts '------------------------------------------------------------'
