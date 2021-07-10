require_relative 'menu'

class Takeaway
  attr_reader :menu
  def initialize(menu)        
    @menu = menu
  end

  def welcome_output
    puts 'Welcome to the Takeaway, what would you like to do?'
  end

  def option_output
    puts 'Enter 1 to view menu, 2 to order food.'
  end

  def receive_choice
    return gets.chomp.to_i
  end

  def select_choice(choice)
    case choice
    when 1 
      puts view_menu
    when 2
        # order food
    end
  end

  def view_menu
    return @menu.menu_items
  end

end

# welcome_output
# option_output
# select_choice(receive_choice)
