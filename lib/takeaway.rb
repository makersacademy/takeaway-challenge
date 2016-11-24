require_relative 'dish'
require_relative 'menu'
require_relative 'order'
require_relative 'message_sender'
require_relative 'customer'
require_relative 'send_sms'

curry = Dish.new("curry", 400)
kebab = Dish.new("kebab", 450)
fish = Dish.new("fish and chips", 550)
pizza = Dish.new("Pizza", 800)

menu = Menu.new
menu.add_dish(curry)
menu.add_dish(kebab)
menu.add_dish(fish)
menu.add_dish(pizza)
