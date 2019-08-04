require_relative '../lib/takeaway.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'
require_relative '../lib/message.rb'
# Feat. Kendrick Lamar

# Rico's pizzeria - born in italy, made in the cloud.
# Rico wants to have a menu, handle orders, and send messages

menu_class = Menu
order_class = Order
message_class = Message

rico_pizza = Takeaway.new(menu_class, order_class, message_class)

rico_pizza.display_menu # duplicate

# by dish object or by dish name?
# select from menu by name?
first_tasty_thing  = rico_pizza.display_menu[10]
second_tasty_thing = rico_pizza.display_menu[3]
third_tasty_thing  = rico_pizza.display_menu[8]

rico_pizza.select(first_tasty_thing, 5)
rico_pizza.select(second_tasty_thing, 3)
rico_pizza.select(third_tasty_thing, 6)
rico_pizza.remove(third_tasty_thing, 2)

rico_pizza.display_order

rico_pizza.set_phone_number(phone_number)

rico_pizza.confirm_order
