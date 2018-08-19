# This main file should be run on start up
# It will have all the references to other files ('require'-s etc)
# There will be a class called TakeawayProcess or something similar
# It will have a method on self called start (this will have a loop in it)
# This class method will call the other methods to:
# load the given menu
# display the menu, prettily
# Order.create_order_items (from user input) <- this is the looped bit
# Order.formatted total (the pretty version) (when user has finished ordering stuff)
# Confirm order (the bit that says "thanks" and sends Twilio confirmation)

# In order to run the program, a user just has to require 'main.rb' and run: OrderProcess.start

require 'twilio-ruby'
require 'dotenv/load'
require_relative 'menu'
require_relative 'menu_item'
require_relative 'order_item'
require_relative 'order'
