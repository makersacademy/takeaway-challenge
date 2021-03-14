require './lib/order_menu'
require './lib/message'
require 'terminal-table'
require 'csv'

class Takeaway

  attr_reader :menu, :active_orders, :order_history
  
  def initialize
    @menu = OrderMenu.new
    @message = Message.new
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
           4. Complete order & Exit
           5. Cancel & exit\n"
  end

  def interface 
    case $stdin.gets.chomp
    when "1" then print_menu
    when "2" then @menu.add_to_order
    when "3" then @menu.order_recipt; @menu.order_total_update; 
                  puts "\nThe current order total is: #{@menu.order_total}"
    when "4" then @message.sms(enter_number); exit
    when "5" then exit
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

  def enter_number
    loop do
      puts "Enter a phone number for confirmation of your delivery:".center(70)
      number = $stdin.gets.chomp
      number[0] == "+" ? number : number = number.delete_prefix("0").prepend('+44')
      puts "You entered #{number} is this correct?".center(70)
      if $stdin.gets.chomp.downcase == "y" 
        return number
      end
    end
  end
end
