require './lib/menu.rb'

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

end
