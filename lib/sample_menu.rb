require './lib/menu.rb'
require './lib/dish.rb'

# preset list of dishes
pad_kapow = Dish.new("pad kapow", 50)
pad_thai = Dish.new("pad thai", 50)
papaya_salad = Dish.new("som tum", 50)
green_curry = Dish.new("gaeng keow wan", 60)
tom_yum = Dish.new("tom yum goong", 70)
gaeng_som = Dish.new("gaeng som", 80)

# create menu and add all dishes to menu
thai_menu = Menu.new
thai_menu.add_dish(pad_kapow)
thai_menu.add_dish(pad_thai)
thai_menu.add_dish(papaya_salad)
thai_menu.add_dish(green_curry)
thai_menu.add_dish(tom_yum)
thai_menu.add_dish(gaeng_som)
