require_relative "menu"

class Order
  attr_reader :selected_dishes

  def initialize(menu:)
    @menu_class = menu
    @selected_dishes = {}
  end

  def list_dishes
    @menu_class.dishes
  end

  def select_dishes
    while true
      puts "hit enter to continue or type 'exit' to exit."
      input = gets.chomp.capitalize
      break if input == "Exit"

      dish, quantity = user_input
      @selected_dishes[dish].nil? ? @selected_dishes[dish] = quantity : @selected_dishes[dish] += quantity
    end
  end

  private

  def user_input
    puts "Dish:"
    dish = gets.chomp.capitalize
    raise "Dish not in menu" unless in_menu?(dish)
    puts "Quantity:"
    quantity = gets.to_i
    return dish, quantity
  end

  def in_menu?(dish)
    @menu_class.dishes.has_key?(dish)
  end
  
end
