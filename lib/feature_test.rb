require_relative 'customer_order'

m = Menu.new
p m 
m.add_dish("apple", 1)
m.add_dish("pear", 1)
p m.menu_list


o =CustomerOrder.new(m)
p  o.instance_menu.menu_list
o.add_to_order("apple",2)
p o.my_order
p o.remove_from_order("apple",1)