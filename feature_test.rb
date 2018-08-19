require './lib/menu'
require './lib/order'
require './lib/messager'
require 'twilio-ruby'

order = Order.new

order.add('spring rolls', 2)

order.check
