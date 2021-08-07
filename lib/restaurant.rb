# Responsible for letting customer choose dishes
require_relative 'order'

class Restaurant
  attr_reader :menu, :customer_selection

  def initialize
    @menu = [
      { dish: "Sushi", price: 7 }, 
      { dish: "Burger", price: 6 }, 
      { dish: "Fries", price: 3 }, 
      { dish: "Noodle Soup", price: 10 }, 
      { dish: "Bahn Mi", price: 9.25 }
    ]
    @customer_selection = []
  end

  def see_menu
    puts "MENU"
    @menu.each_with_index do |dish, index|
      menu_num = index + 1
      puts "#{menu_num}. #{dish[:dish]} £#{dish[:price]}"
    end
  end

  def select_dish(menu_num)
    # error if no arguments given
    raise "Sorry, that's not on the menu" if menu_num > menu.length

    @customer_selection << menu[menu_num - 1]
  end

  def place_order
    puts "Choose a menu number to add to your order"
    Order.new(@customer_selection) # save to variable so I can access again
  end
end
