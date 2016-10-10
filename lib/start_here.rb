require_relative './dish.rb'
require_relative './menu.rb'
require_relative './order_line.rb'
require_relative './order.rb'
require_relative './interface.rb'
require_relative './texter.rb'

takeaway = Interface.new('/Users/malinnaleach/Programs/takeaway-challenge/lib/dishes_list.csv')

takeaway.user_interaction
