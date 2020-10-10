require './lib/menu.rb'
require './lib/takeaway.rb'

# p carnal_menu = Menu.new
p carnal = Takeaway.new
# p carnal.print_dishes

p 'These are the dishes I add'
p carnal.add_dish('Guacamole', 2)
p carnal.add_dish('Nachos')
p 'This is the basket after:'
p carnal.basket