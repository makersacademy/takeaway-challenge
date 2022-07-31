require './lib/takeaway'
 menu = Menu.new
 t = Takeaway.new
 menu.dish("A", 3)
 puts "#{menu}"
 menu.dish("B", 5)
 puts "#{menu}"
 t.show_menu(menu) 
 menu.list
 t.add_order("A", 2)
 t.add_order("B", 2)
 t.orders
