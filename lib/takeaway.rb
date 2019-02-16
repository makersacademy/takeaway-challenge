require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    puts "Hello, Here is a list of our tasty food"
    @menu.dishes.each do |dish|
      puts "Menu Number: #{dish.menu_number},"\
      " Name: #{dish.dish_name}, Price: #{dish.dish_cost}"
    end
  end
end
