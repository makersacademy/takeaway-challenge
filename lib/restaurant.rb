# Responsible for letting customer choose dishes
require_relative 'order'

class Restaurant
  attr_reader :menu, :customer_selection, :orders

  def initialize
    @menu = [
      { dish: "Sushi", price: 7 }, 
      { dish: "Burger", price: 6 }, 
      { dish: "Fries", price: 3 }, 
      { dish: "Noodle Soup", price: 10 }, 
      { dish: "Bahn Mi", price: 9.25 }
    ]
    @orders = []
    @customer_selection = []
  end

  def see_menu
    puts "MENU".center(30, " -")
    @menu.each_with_index do |dish, index|
      menu_num = index + 1
      puts "#{menu_num}. #{dish[:dish]} £#{dish[:price]}"
    end
    # select_from_menu(STDIN.gets.chomp)
  end

  def select_from_menu(menu_num)
    puts "You have selected #{menu_num}"
  case menu_num
  when "exit" then @customer_selection = []; see_menu
  else
    puts "I don't know what you meant, please try again"
  end
  end

  # def ask_user_for_order
  #   menu_num = STDIN.gets.chomp
  #   select_dish(menu_num.to_i)
  # end

  def place_order
    order = Order.new(@customer_selection)
  end

  private
  def select_dish(menu_num)
    # error if no arguments given
    raise "Sorry, that's not on the menu" if menu_num > menu.length

    @customer_selection << menu[menu_num - 1]
  end
end
