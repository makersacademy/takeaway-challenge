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
@thai_menu = Menu.new
@thai_menu.add_dish(pad_kapow)
@thai_menu.add_dish(pad_thai)
@thai_menu.add_dish(papaya_salad)
@thai_menu.add_dish(green_curry)
@thai_menu.add_dish(tom_yum)
@thai_menu.add_dish(gaeng_som)

# customer interaction
puts "Welcome to the Thai Takeaway!"

def show_customer_choices
  puts "Choose your option below> Alternatively, press enter or 0 to quit:"
  puts "1 - view menu"
  puts "2 - create an order"
end

def show_menu
  puts "Please see our full menu:"
  @thai_menu.see_menu
end

while true
  show_customer_choices
  choice = gets.chomp.to_i
  if choice == 0
    break
  elsif choice == 1
    show_menu
  elsif choice == 2
    puts "running create order function"
  else
    puts "option not recognised"
  end
end



# while choice != "menu"
#   puts "Type 'menu' to see the menu"
#   choice = gets.chomp
#   if choice == "menu"
#     @thai_menu.see_menu
#     break
#   end
#   puts "I don't uderstand what you typed! Try again..."
# end
