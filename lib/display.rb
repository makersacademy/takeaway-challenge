
class Display
  def read_input
    STDIN.gets.chomp
  end

  def displays_menu(menu)
    print "#{menu.extracts_starters} #{menu.extracts_main_course} #{menu.extracts_dessert}"
  end

  def print_interactive_menu
    puts "1. Place orders"
    puts "2. Show order selections"
    puts "7. Exit"
  end
end
