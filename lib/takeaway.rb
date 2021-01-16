class Takeaway

  def initialize(menu)
    @menu = menu
  end

  def show_menu
    puts @menu.pretty_dishes
  end

  def prompt
    puts "Select an option:\n1.\tMenu\n9.\tExit"

    user_input = gets.chomp

    case user_input
    when "1"
      show_menu
    when "9"
      exit 0
    else
      puts "Please select a valid option"
    end
  end

end
