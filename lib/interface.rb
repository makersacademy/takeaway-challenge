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
    puts '3. Print invoice'
    puts '4. Exit'
    print '>  '
  end

  def process_response(selection)
    case selection
      when "1"
        Print_menu.new.print
      when "4"
        exit
      else
        puts "This option doesn't exit. Please try again"
    end
  end

end
