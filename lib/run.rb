require_relative 'userinterface.rb'
require_relative 'menu.rb'
require_relative 'dish.rb'
require_relative 'basket.rb'
menu = Menu.new
menu.add_dish(Dish.new("Moblin Stew",12))
menu.add_dish(Dish.new("Moomoo Beef",13))
menu.add_dish(Dish.new("Hoy Fried Karp",11))
menu.add_dish(Dish.new("Mixed Leever Salad",8))
menu.add_dish(Dish.new("Deku Nut Salad",7))
menu.add_dish(Dish.new("Kakariko Fried Cuccoo",9))
menu.add_dish(Dish.new("Moomoo Icecream",3))
menu.add_dish(Dish.new("Hylian Parfait",5))
menu.add_dish(Dish.new("Market Mead",2))
user = UserInterface.new(menu,Basket.new)
user.see_menu
user_input = ""
while(user_input != "exit")do
  user_input = gets.chomp
  begin
    if user_input == "help"
      print("\nadd_to_basket remove_from_basket see_basket see_menu place_order\n")
    elsif
      eval("user."+user_input)
    end
  rescue
    puts "try again"
  end
end
