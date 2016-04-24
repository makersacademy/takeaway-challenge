require_relative './lib/restaurant.rb'
require_relative './lib/menu.rb'
require_relative './lib/messenger.rb'
require 'rubygems'
require 'twilio-ruby'


# nandos = Restaurant.new
# p nandos.show_menu
# p nandos.add_to_menu "baked anchovies",3.99
# p nandos.show_menu
# p nandos.add_to_order(2,"baked anchovies")

mess = Messenger.new
p mess.send_text
