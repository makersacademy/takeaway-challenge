require 'dotenv'
Dotenv.load
require './lib/takeaway'
require './lib/dish'
require './lib/order_confirmation'

takeaway = TakeAway.new

p takeaway.list_menu

takeaway.add_to_basket("Bratwurst in a bun",1)
takeaway.add_to_basket("Käsekrainer in a bun",2)
takeaway.add_to_basket("Crispy onions",3)

p takeaway.basket
