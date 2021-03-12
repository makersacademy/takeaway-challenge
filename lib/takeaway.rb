require 'csv'

class Takeaway

  attr_reader :menu, :active_orders, :order_history, :array_of_rows
  
  def initialize
    @menu = Menu.new
    @active_orders = Array.new
    @order_history = Array.new
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

  def new_order
    Order.new
  end

  def interface_print
    print "\n
           Please make a selection
           -----------------------
           1. View menu
           3. New order
           9. Exit\n"
  end

  def interface
    selection = $stdin.gets.chomp
    case selection
    when "1"; print_menu
    when "2"; "make new order"
    when "3"; "check total"
    when "9"; exit
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
