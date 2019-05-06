# Feature Testing

require './lib/takeaway.rb'
require './lib/order_management.rb'
require './lib/food_menu.rb'
require './lib/twilio_message.rb'

food_menu = FoodMenu.new({ naan: 0.90, penang_curry: 5.00, spare_ribs: 6.00 })
# food_menu.we_serve?(:naan)
# food_menu.price(:naan)

order_management = OrderManagement.new(food_menu)
twilio_message = Message.new

takeaway = Takeaway.new(food_menu, order_management)
# takeaway.see_dishes
# takeaway.place_the_order({naan: 2, penang_curry: 2})
