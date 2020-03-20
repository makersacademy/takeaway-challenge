require './menu.rb'
require './order.rb'
require './takeaway.rb'

takeaway = Takeaway.new(menu: Menu.new)
takeaway.menu.add_dish("chicken", 5)
takeaway.menu.add_dish("fish", 3)
takeaway.menu.add_dish("cabbage", 5)
takeaway.print_menu
takeaway.place_order("chicken", 1)
takeaway.place_order("cabbage", 1)
takeaway.confirmation
takeaway.sent_message

takeaway.place_order("beef", 5)
