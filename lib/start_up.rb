require './lib/takeaway.rb'

class Start

  
menu = Menu.new
takeaway = Takeaway.new
takeaway.add_menu_items(menu)
order = Order.new(takeaway)
checkout = Checkout.new
