require './docs/menu.rb'

class Takeaway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def header
    puts "Welcome to the God of Cookery Takeaway.\n Choose an option"
    puts "1. See menu"
    puts "2. Choose dishes"
    puts "3. Basket"
    puts "4. Exit"
  end

  def show_menu
     @menu.display
  end

  def choose_dish(number)
    @basket << @menu.items.keys[number - 1]
  end
end
