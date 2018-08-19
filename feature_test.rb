require './lib/menu'
require './lib/order'
require './lib/sms'
require 'twilio-ruby'

menu = Menu.new
order = Order.new

order.make_order('spring rolls', 2)

order.basket

order.check_order

sms = SMS.new

sms.send_msg
