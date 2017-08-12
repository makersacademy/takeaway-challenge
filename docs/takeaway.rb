require './docs/menu.rb'

class Takeaway
  attr_reader :name

  def initialize
  end

  def header
    puts "Welcome to the God of Cookery Takeaway.\n Choose an option"
    puts "1. See menu"
    puts "2. Choose dishes"
    puts "3. Confirm order"
    puts "4. Exit"
  end

  def show_menu
    Menu.new.display
  end
end
