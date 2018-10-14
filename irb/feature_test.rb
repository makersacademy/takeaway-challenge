require_relative '../lib/takeaway.rb'
require_relative '../lib/menu_factory.rb'

takeaway = Takeaway.new
takeaway.display_menu
takeaway.place_order([['Yasai Gyoza', 1], ['Duck Donburi', 1]])
takeaway.display_order
takeaway.confirm_order(9, nil)
