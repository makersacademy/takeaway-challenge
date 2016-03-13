require_relative 'customer_order'

m = Menu.new
m.add_dish("apple", 3)
m.add_dish("pear", 4)

o =CustomerOrder.new(m)

p o.current_menu

o.add_to_order("apple",5)

p o.total_cost

p o.my_order

o.add_to_order("apple",2)

p o.my_order

p o.total_cost 

o.remove_from_order("apple",1)

p o.my_order

o.add_to_order("pear",2)
p o.my_order
p o.total_cost 
