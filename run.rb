require_relative './setup'

def run(menu)
  # welcome message
  puts "\nWelcome to Al's Bar\n"

  # view menu
  puts "\n Here's our menu\n"
  menu.view_menu

  # options
  while true do
    puts "\n What would you like to do?
    1 View menu
    2 Select dishes
    3 View basket
    4 Check basket total
    5 Checkout\n"

    selection = gets.chomp
    case selection
    when "1"
      menu.view_menu
    when "2"
      puts "\n Here's the menu again \n"
      menu.view_menu
      puts "Which dish would you like?"
      name = gets.chomp
      puts "How many of this dish would you like?"
      number = gets.chomp.to_i
      menu.select_dish(name, number)
    when "3"
      menu.basket.view_basket
    when "4"
      menu.basket.items_total
    when "5"
      menu.basket.complete_order
      break
    end
  end
end
