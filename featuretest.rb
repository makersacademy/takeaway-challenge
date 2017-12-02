require './lib/menu.rb'

p menu = Menu.new

menu.print_menu
p menu.choose_item("Lunch")
p menu.choose_item("Lunchs")
#menu.test
