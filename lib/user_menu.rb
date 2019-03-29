

class UserMenu

  def print_options
  #  loop do
      return options
  #    process_menu_selection(STDIN.gets.chomp)
  #  end
  end

  def options
  "
  1. Show Menu\n
  2. Order\n
  3. Total Cost\n
  4. Place Order\n
  "
  end

  def process_menu_selection(option)
    if option = 1
      "Showing Menu"
    elsif option = 2
      "Order Your Meal"
    elsif option = 3
      "Showing Total Cost of Order"
    elsif option = 4
      "Finalise Your Order"
    else
      "Please select an option 1 - 4"
    end
  end
end
