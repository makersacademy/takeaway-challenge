require './lib/takeaway.rb'


menu = Menu.new
takeaway = Takeaway.new
takeaway.add_menu_items(menu)
order = Order.new(takeaway)
checkout = Checkout.new
