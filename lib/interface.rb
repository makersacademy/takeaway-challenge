require './lib/menu_selection.rb'
require './lib/menu_list.rb'
require './lib/print_invoice.rb'
require './lib/confirm_order'
require './lib/print_menu.rb'

# customer interface for takeaway
class Interface

  attr_reader :current_order

  def initialize
    @current_order =[]
  end

  def build_interface
    loop do
      print_options
      process_response(STDIN.gets.chomp)
    end
  end

  def print_options
    puts "\n1. Show Menu"
    puts '2. Make Selection'
    puts '3. See Basket'
    puts '4. Checkout'
    puts '5. Exit'
    print '>  '
  end

  def process_response(selection)
    case selection
      when "1"
        Print_menu.new.print(menu_list.menu_items)
      when "2"
        @current_order = @current_order + Menu_selection.new(menu_list.menu_items).selection
      when "3"
        Print_menu.new.print(@current_order)
      when "4"
      when "5"
        exit
      else
        puts "This option doesn't exit. Please try again"
    end
  end

  def menu_list
    @menu_list ||= Menu_list.new
  end

end
