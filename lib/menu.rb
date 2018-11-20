require_relative "./order.rb"

class Menu
  MENU = {
    "Garlic Bread" => 4, "Grissini Breadsticks" => 5,
    "Tricolore Salad" => 5, "Zucchine Fritte" => 4,
    "Margherita" => 8, "Quattro Formaggi" => 11,
    "Napoletana" => 9, "Romana" => 13,
    "Americana" => 10, "Penne Arrabiata" => 8,
  }

  attr_reader :MENU

  def initialize(order = Order)
    @order = order
  end

# all menu objects in one
  def show_menu
    menu_header
    put_menu
    menu_footer
    menu_selection
  end

  def menu_header
    puts `clear`
    puts "|-------------------------|".center(30)
    puts "|   Takeaway Pizza Menu   |".center(30)
    puts "|-------------------------|".center(30)
  end

# iterates through the menu hash, showing it as a menu
  def put_menu
    MENU.each do |item, value|
      puts "#{item}: £#{value}".center(30)
    end
  end

  def menu_footer
    puts
    puts "Delivery available with".center(30)
    puts "1 hour timeslots".center(30)
    puts
    puts "would you like to make an".center(30)
    puts "order today? (Y/N)".center(30)
    puts
  end

  def menu_selection
    @result = gets.chomp.downcase
    raise "I think you meant to say Y" unless @result == "y".downcase
    @order.new.order_process
  end
end
#
# menu = Menu.new
# menu.show_menu
