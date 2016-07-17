require './lib/customer'

puts "*****************************************"
puts "Creating dishes"
p slug_soup = Dish.new("Slug Soup", 4.99)
p fried_wasp = Dish.new("Fried Wasps with Ant Salad", 8.99)
p moth_saute = Dish.new("Moths Sauted in Butter", 9.99)
p braised_beetle = Dish.new("Braised Stag Beetle", 11.99)
p spider_pie = Dish.new("Minced Taratula Pie", 14.99)
p maggot_burger = Dish.new("Maggot Burger", 10.99)
puts "*****************************************"
puts "Creating menu"
p menu = Menu.new
puts "*****************************************"
puts "Adding dishes to menu"
menu.add_dish(slug_soup)
menu.add_dish(fried_wasp)
menu.add_dish(moth_saute)
menu.add_dish(braised_beetle)
menu.add_dish(spider_pie)
menu.add_dish(maggot_burger)
p menu
puts "*****************************************"
puts "Creating a customer"
jason = Customer.new("Jason", "50 Commercial St, London E1 6LT", "07522253914")
p jason
puts "*****************************************"
puts "Creating restaurant"
p grub = Restaurant.new(menu)
puts "*****************************************"
puts "Creating a new takeaway order"
p jason.new_order(grub)
puts "*****************************************"
puts "View restaurant menu"
jason.view_menu
puts "*****************************************"
puts "Add items to order"
puts "jason.order_item(Slug Soup, 1)"
puts "jason.order_item(Braised Stag Beetle, 2)"
puts "jason.order_item(Minced Taratula Pie, 3)"
puts "jason.order_item(Maggot Burger, 4)"
jason.order_item("Slug Soup", 1)
jason.order_item("Braised Stag Beetle", 2)
jason.order_item("Minced Taratula Pie", 3)
jason.order_item("Maggot Burger", 4)
puts "*****************************************"
puts "View ordered items"
jason.view_order
puts "*****************************************"
puts "Complete order"
jason.complete_order
