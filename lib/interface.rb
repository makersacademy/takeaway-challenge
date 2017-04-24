require './lib/menu_selection.rb'
require './lib/menu_list.rb'
require './lib/print_invoice.rb'
require './lib/confirm_order'
require './lib/print_menu.rb'

# customer interface for takeaway
class Interface

  def build_interface
    loop do
      print_options
      process_response(STDIN.gets.chomp)
    end
  end

  def print_options
    puts "\n1. Show Menu"
    puts '2. Make Selection'
    puts '3. Checkout'
    puts '4. See Order'
    puts '5. Exit'
    print '>  '
  end

  def process_response(selection)
    case selection
      when "1"
        Print_menu.new.print(Menu_list.new.menu_items)
      when "2"
      when "3"
      when "4"
      when "5"
        exit
      else
        puts "This option doesn't exit. Please try again"
    end
  end

end
