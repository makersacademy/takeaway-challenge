

class Interface

  display_menu

  customer_input = gets.chomp

  case customer_input
    when "1"
      puts 'order'
    when "2"

    when "3"

    when "4"

    when "5"

    when "9"
      exit
    else
      puts "invalid input, try agian"
  end

  private
  
  def display_menu
    puts "Welcome to Fish & Chip Shop"
    puts "---------------------------"
    puts "MENU:"
    puts "- press 1 to see our menu."
    puts "- press 2 order a dish."
    puts "- press 3 to see your order."
    puts "- press 4 to see your order total."
    puts "- press 5 to place an order."
    puts "- press 9 to exit."
    puts "---------------------------"
    print "What would you like to do?: "
  end
end
