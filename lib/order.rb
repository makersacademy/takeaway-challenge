require_relative 'foodmenu'
require_relative 'sendtext'

class Order
  attr_reader :total

  def initialize
    @menu = FoodMenu.new
    @total = 0
  end

  def take_order
    loop do
      puts "Please enter the index of the dish or '0' to return to the main menu:"
      index_of_dish = STDIN.gets.chomp.to_i
      break if index_of_dish.zero?
      selected_dish = @menu.order_list.find { |x| x[:index] == index_of_dish }
      puts "How many #{selected_dish[:dish]} would you like to order?"
      add_to_total
    end
  end

  def add_to_total
    num_of_dish = STDIN.gets.chomp.to_i
    total_price = num_of_dish * selected_dish[:price]
    @total += total_price
    check_total
  end

  def display_menu
    @menu.display
  end

  def check_total
    puts "> > > > > Total price to checkout is £#{@total} < < < < <"
  end

end
