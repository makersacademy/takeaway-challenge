require_relative 'menu.rb'
require_relative 'customer_view.rb'
menu = Menu.new
menu.load_from_csv('../test_menu.csv')
menu.set_menus
menu2 = Menu.new
menu2.load_from_csv('../test_menu2.csv')
menu2.set_menus
CustomerView.new
