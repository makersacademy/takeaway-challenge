require_relative './lib/menu'

def setup_menu
  puts "\nWelcome to Alexis' Takeaway Challenge - Makers Academy Week 2\n"

  puts "\nSetting up the menu..."
  my_menu = Menu.new
  puts "The menu has been created. It's called 'my_menu'.\n"

  puts "\nAdding some dishes to my_menu..."
  wings = my_menu.new_dish("Cauliflower Buffalo Wings", 6)
  onion_soup = my_menu.new_dish("French Onion Soup", 7)
  carpaccio = my_menu.new_dish("Beef Carpaccio", 8)
  whitebait = my_menu.new_dish("Whitebait", 6.5)
  burger = my_menu.new_dish("Big Bad Burger", 13)
  salad = my_menu.new_dish("Great Greek Salad", 9)
  kebabs = my_menu.new_dish("Roast Veg Kebabs", 10)
  sundae = my_menu.new_dish("Biscoff Sundae", 6)
  pudding = my_menu.new_dish("Sticky Toffee Pudding", 7)
  puts "Dishes added.\n"

  puts "\nLet's view the menu...\n"
  my_menu.view_menu
  puts "\nSetup complete."
  my_menu
end
