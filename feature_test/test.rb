require_relative '../lib/text'
require_relative '../lib/order'
require_relative '../lib/menu'
require_relative '../lib/restaurant'

restaurant = Restaurant.new
restaurant.place_order

p restaurant.menu.view
restaurant.order.add("Salmon crudo", 6)
p restaurant.order.total_correct?
p restaurant.order.text_confirm
