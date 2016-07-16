require './lib/take_away'
require './lib/customer'

puts "*****************************************"
puts "Creating restaurant"
p grub = TakeAway.new
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
menu.menu_items
puts "*****************************************"
puts "Creating a customer"
jason = Customer.new("Jason", "50 Commercial St, London E1 6LT", "07522253914")
p jason
puts "*****************************************"
