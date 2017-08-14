require_relative './menu.rb'
require_relative './user.rb'

menu = Menu.new
menu.print_menu_header
menu.show_menu_hash
menu.user_selection


user = User.new
