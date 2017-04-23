require_relative 'menu.rb'
require_relative 'customer_view.rb'

menu = Menu.new
menu.load_csv('test_menu.csv')
menu.save_menu
menu2 = Menu.new
menu2.load_csv('test_menu2.csv')
menu2.save_menu

customer = CustomerView.new

