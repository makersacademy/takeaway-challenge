# Responsible for letting customer choose dishes
require_relative 'order'

class Restaurant
  attr_reader :dishes, :customer_selection

  def initialize
    @dishes = [
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
    @dishes.each_with_index do |dish, index|
      menu_num = index + 1
      puts "#{menu_num}. #{dish[:dish]} £#{dish[:price]}"
    end
  end

  def select_dish(menu_num)
    # error if no arguments given
    # error if menu_num not on menu
    @customer_selection << dishes[menu_num - 1]
  end

  def place_order
    Order.new(@customer_selection) # save to variable so I can access again
  end
end
