require_relative 'Menu'

class Takeaway
  include Menu
  attr_reader :dishes

  def initialize
    @basket = {}
  end

  def read_menu
    MENU.each_with_index do |(food, price), index|
      puts "#{index + 1}. #{food} => £#{price}"
    end
  end

  def customer_selection
  @food_item = ""
  while @food_item != "exit"
    select_item
    break if @food_item == "exit"
    select_quantity
    add_items
  end
  confirm_order
end

  def select_item
    puts "Please select an item from the menu. Type 'exit' to finish."
    @food_item = gets.chomp
    menu_check
  end

  def menu_check
    until MENU.keys.include? @food_item
      break if @food_item == "exit"
      puts "Your selection is not on the menu - please choose again."
      @food_item = gets.chomp
    end
  end

  def select_quantity
    puts "Quantity?"
    @quantity = gets.chomp
  end

  def add_items
    @basket[@item] = @quantity
  end
end
