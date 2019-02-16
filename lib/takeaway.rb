require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :current_order
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @current_order = order
  end

  def show_menu
    puts "Hello, Here is a list of our tasty food"
    @menu.dishes.each do |dish|
      puts "Dish Number: #{dish.dish_number},"\
      " Name: #{dish.dish_name}, Price: #{dish.dish_cost}"
    end
  end

  def add_to_order(dish_num, quantity = 1)
    current_dish = @menu.dishes.find do |dish|
      dish.dish_number == dish_num
    end
    @current_order.add(current_dish, quantity)
  end

  def remove_from_order(dish_num)
    current_dish = @menu.dishes.find do |dish|
      dish.dish_number == dish_num
    end
    @current_order.remove(current_dish)
  end

  def view_order
    puts "Here is your current order"
    @current_order.contents.each do |dish|
      puts "Dish Number: #{dish.dish_number},"\
      " Name: #{dish.dish_name}, Price: #{dish.dish_cost}"
    end
    puts "The total cost of your order is #{@current_order.cost}"
  end
end
