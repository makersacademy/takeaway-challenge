require_relative 'sandcream'

DELIVERY_FEE = 3.5
ORDER_TOTAL = 0

class Happiness_Delivered
  attr_accessor :basket, :order_total, :menu

  def initialize(basket = [])
    @menu = Sandcream.new
    @basket = basket
    @order_total = ORDER_TOTAL
  end

  def print_menu_options
    puts '1. View Sand Creams menu'
    puts '2. Select your order'
    puts '3. Review your order'
    puts '4. Complete your order'
    puts '5. Exit menu'
  end

  def interactive_menu
    loop do
      print_menu_options
      interface(STDIN.gets.chomp)
    end
  end
  
  def interface(customer_order)
    case customer_order
    when '1'
      print_menu
    when '2'
      select_order
    when '3'
      review_order
    when '4'
      complete_order
    when '5'
      exit
    else 
      puts 'Please enter a valid menu option'
    end
  end

  def print_menu
    welcome_note
    @menu.print_sando
    @menu.print_icecream
  end

  def select_order
    puts 'magic content'
  end

  def review_order
    puts 'magic content'
  end

  def complete_order
    puts 'magic content'
  end

  private

  def welcome_note
    puts "-" * 60
    puts 'Welcome to Happiness Delivered! Please select from' 
    puts 'the following menu options to place your order.'
    puts "-" * 60
    
  end

end

hd = Happiness_Delivered.new
hd.print_menu