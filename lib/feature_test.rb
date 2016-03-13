require_relative 'complete_order'


m = Menu.new
m.add_dish("apple", 3)
m.add_dish("pear", 4)

o =CustomerOrder.new(m, "phoebe", ENV['SUPER_SECRET'])

p o.current_menu

o.add_to_order("apple",5)


p o.my_order

o.add_to_order("apple",2)

p o.my_order

o.remove_from_order("apple",1)

p o.my_order

o.add_to_order("pear",2)

p o.my_order


