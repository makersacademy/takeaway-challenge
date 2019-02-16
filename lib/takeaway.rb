require_relative 'menu'

class Takeaway
  attr_reader :current_order
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @current_order = order
  end

  def show_menu
    puts "Hello, Here is a list of our tasty food"
    @menu.dishes.each do |dish|
      puts "Menu Number: #{dish.dish_number},"\
      " Name: #{dish.dish_name}, Price: #{dish.dish_cost}"
    end
  end

  def add_to_order(dish_num, quantity)
    dish = @menu.select do |dish|
      dish.dish_number == dish_num
    end
    @current_order.add(dish, quantity)
  end
end
