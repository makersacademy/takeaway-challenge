require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Takeaway
  attr_reader :current_order
  def initialize(menu = Menu.new, order = Order.new, con = Confirmation.new)
    @menu = menu
    @current_order = order
    @confirmation = con
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
    fail "You provided an incorrect dish number!" if current_dish.nil?

    @current_order.add(current_dish, quantity)
  end

  def remove_from_order(dish_num)
    current_dish = @menu.dishes.find do |dish|
      dish.dish_number == dish_num
    end
    fail "You provided an incorrect dish number!" if current_dish.nil?
    @current_order.remove(current_dish)
  end

  def view_order
    puts "Here is your current order"
    fail "Nothing has been added to the current order!"\
     if @current_order.contents.empty?

    @current_order.contents.each do |dish|
      puts "Dish Number: #{dish.dish_number},"\
      " Name: #{dish.dish_name}, Price: #{dish.dish_cost}"
    end
    puts "The total cost of your order is #{@current_order.cost}"
  end

  def confirm_order
    fail "Nothing has been added to the current order!"\
     if @current_order.contents.empty?

    @confirmation.send_confirmation
  end
end
