require_relative 'menu'

class Takeaway

  attr_reader :menu, :your_order, :total_cost

  def initialize(menu = Menu.new)
    @menu = menu
    @your_order = []
    @total_cost = 0
  end

  def print_header
    header = "Welcome to the Koala Cafe! All prices are in £."
    print header.chomp
    print
  end
  
  def print_options
    puts "1. View menu"
    puts "2. Add item to cart"
    puts "3. View your cart"
    puts "4. Place order"
    puts "5. Cancel order"
  end
  
  def interactive_menu
    print_header
    loop do
      print_options
      process(gets.chomp)
    end
  end
  
  def process(selection)
    case selection
    when "1"
      see_menu
    when "2"
      puts "Which food item do you want?"
      food = gets.chomp
      puts "What quantity of #{food} do you want?"
      quantity = gets.chomp
      add_to_cart(food, quantity.to_i)
    when "3"
      view_cart
    when "4"
      puts "Option 4 is unavailable at this time"
    when "5"
      exit
    end
  end

  def see_menu
    @menu.menu.each { |food, price| puts "#{food}, #{price}" }
  end

  def add_to_cart(food, quantity)
    @your_order << "#{quantity} x #{food}"
    @total_cost += (@menu.menu[food] * quantity)
  end

  def view_cart
    puts @your_order
    puts "Order total is £#{total_cost}."
  end

end