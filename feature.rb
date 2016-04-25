require_relative './lib/restaurant.rb'
require_relative './lib/menu.rb'
require_relative './lib/messenger.rb'

# require 'rubygems'
# require 'twilio-ruby'

# order = Order.new
# p order.add_to_order(3,"anchovies & diesel")
# p order.show_order
# p check_total

nandos = Restaurant.new
p nandos.add_to_order(3,"anchovies & diesel")
p nandos.show_order
p nandos.check_total
p nandos.show_menu
p nandos.checkout(9.0)
# nandos.checkout(10)
# p nandos.check_total

# mess = Messenger.new
# p mess.send_text

# p nandos.include?("badger")
# p nandos.show_menu
# p nandos.add_to_order(2,"anchovies and diesel")

# p order_new = Order.new
# p order_new.empty?
