require 'menu'

class Interface

  attr_reader :food

  def initialize
    @food = Menu.new
  end

  def food_menu
    @food.menu
  end

  def options_menu
    puts "------------------------------------------"
    puts "1. Place your order"
    puts "2. View your order"
    puts "9. Exit"
  end

  def input(option)
    case option
    when "1"
      place_order
    when "2"
      order_confirmation
    when "9"
      puts "Goodbye"
      exit
    else
      puts "A dinnae understaun, try again"
    end
  end

  def interactive_menu
    loop do
      food_menu
      options_menu
      process(STDIN.gets.chomp)
    end
  end

end
