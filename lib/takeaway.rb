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
           2. New order
           3. Order total
           9. Exit\n"
  end

  def interface
    selection = $stdin.gets.chomp
    case selection
    when "1" then print_menu
    when "2" then @menu.add_to_order; puts @menu.order_list
    when "3" then @menu.order_total_update; puts "The current order total is:#{@menu.order_total}"
    when "9" then exit
    else
      print "That selection is incorrect, try again.".center(70)
    end
  end

  def print_menu
    table = CSV.read('./lib/menu_items.csv', headers: true, converters: :numeric)
    table.delete("preparation time")
    print "#{table}".center(60)
  end
end
