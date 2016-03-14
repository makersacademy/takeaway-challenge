require 'dotenv'
Dotenv.load

require 'rubygems'
require 'twilio-ruby'
require './lib/takeaway'
require './lib/dish'
require './lib/order_confirmation'

# takeaway = TakeAway.new
# oc = OrderConfirmation.new
#
# p takeaway.list_menu
#
# takeaway.add_to_basket("Bratwurst in a bun",1) #2,49
# takeaway.add_to_basket("Käsekrainer in a bun",2) # 2,79
#
# p takeaway.basket
# p takeaway.total
# takeaway.order(5.58)
