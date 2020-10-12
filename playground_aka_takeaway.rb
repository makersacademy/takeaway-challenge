require './lib/takeaway.rb'
require './lib/printer.rb'

p carnal = Takeaway.new
# p carnal_printer = Printer.new
# p carnal_menu.print_dishes
p 'This is the menu'
p carnal.display_menu
p 'These are the dishes I add'
p carnal.add_dish('Guacamole', 2)
p carnal.add_dish('Nachos')
p 'This is the basket after:'
p carnal.basket_summary
p 'This is just the prices of whats in your basket'
p carnal.order_total
p carnal.item_totals


# @dishes.select { |food| food[:dish] == dish 
# }

