require_relative '../lib/takeaway.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'
require_relative '../lib/sms_client.rb'
# Feat. Kendrick Lamar

# Rico's pizzeria - born in italy, made in the cloud.
# Rico wants to have a menu, handle orders, and send messages

menu = Menu.new("./menus/pizza.csv",Dish)
order_class = Order
message = SMSClient.new
message.set_credentials(ENV.fetch("TWILIO_AUTH_TOKEN"),ENV.fetch("TWILIO_ACCOUNT_SID"),ENV.fetch("TWILIO_FROM_NUMBER"))
message.set_to_number(ENV.fetch("PERSONAL_MOBILE"))
message.send_message("Asd")
rico_pizza = Takeaway.new(menu, order_class, message)

rico_pizza.menu.display # duplicate

# by dish object or by dish name?
# select from menu by name?
first_tasty_thing  = rico_pizza.menu.items[10]
second_tasty_thing = rico_pizza.menu.items[3]
third_tasty_thing  = rico_pizza.menu.items[8]

rico_pizza.order.add_order_items(first_tasty_thing, 5)
rico_pizza.order.add_order_items(second_tasty_thing, 3)
rico_pizza.order.add_order_items(third_tasty_thing, 6)
rico_pizza.order.add_order_items(third_tasty_thing, 2)

rico_pizza.order.display


rico_pizza.confirm_order(rico_pizza.order.total.round(2))
