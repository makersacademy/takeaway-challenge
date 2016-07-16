require './lib/menu'

puts "*****************************************"
puts "Creating dishes"
p slug_soup = Dish.new("Slug Soup", 4.50)
p fried_wasp = Dish.new("Fried Wasp Grubs", 3.99)
p moth_saute = Dish.new("Moths Sauted in Butter", 9.50)
p braised_beetle = Dish.new("Braised Stag Beetle", 11.50)
p spider_pie = Dish.new("Taratula Pie", 14.50)
p maggot_burger = Dish.new("Maggot Burger", 10.50)
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
p menu.menu_items
puts "*****************************************"
