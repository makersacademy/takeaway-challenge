require './lib/menu'
require 'terminal-table'
require 'csv'

class Takeaway

  attr_reader :menu, :active_orders, :order_history
  
  def initialize
    @menu = Menu.new
  end

  def ascii_render
    print(File.read("./lib/banner.txt"))
  end

  def interactive_menu
    loop do
      interface_print
      interface
    end
  end

  def interface_print
    print "\n
           Please make a selection
           -----------------------
           1. View menu
           2. Add to order
           3. Order total
           9. Complete order & Exit\n"
  end

  def interface
    selection = $stdin.gets.chomp
    case selection
    when "1" then print_menu
    when "2" then @menu.add_to_order
    when "3" then @menu.order_recipt; @menu.order_total_update; 
                  puts "\nThe current order total is: #{@menu.order_total}"
    when "9" then exit
    else
      print "That selection is incorrect, try again.".center(70)
    end
  end

  def print_menu
    menu_array = CSV.read('./lib/menu_items.csv').to_a
    menu_table = Terminal::Table.new do |v|
      v.headings = menu_array[0]
      v.rows = menu_array[1..]
    end
    menu_table.style = { :alignment => :center }
    puts menu_table
  end
end
