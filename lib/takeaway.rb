require_relative 'menu.rb'
require_relative 'order.rb'
class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_menu
    puts "Welcome to Project Takeaway!"
    select_food_type
  end

  def select_food_type
    puts "What are we feeling today? Pick a number...\n1. Fish and Chips\n2. Chinese Food?"
    food_type = STDIN.gets.chomp
      if food_type == "1"
        @menu.load_chippy_menu
        @selected_menu = @chippy_menu
      else food_type == "2"
        @menu.load_chinese_menu
        @selected_menu = @chinese_menu
      end
  end

end
