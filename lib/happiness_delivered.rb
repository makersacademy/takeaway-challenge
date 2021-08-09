# require 'customer_sms'
require_relative 'sandcream'

class HappinessDelivered
  # include OrderConfirmation

  attr_accessor :basket, :order_total, :menu

  def initialize(basket = [])
    @menu = Sandcream.new
    @basket = basket
    @order_total = []
  end

  def interactive_menu
    loop do
      print_menu_options
      interface(STDIN.gets.chomp)
    end
  end
  
  def interface(customers_order)
    case customers_order
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
    order
    lines
    puts 'Your current order:'
    @basket.map { |dish| puts "• #{dish[:sando]}#{dish[:icecream]}" }
  end

  def review_order
    lines
    puts 'Your current order total:'
    @basket.map { |price| puts "£ #{'%.2f' % price[:price]}" }
    puts '-------'
    @basket.map { |price| (@order_total << price[:price]) } 
    puts "£ #{'%.2f' % @order_total.sum}"
  end

  def complete_order
    # OrderConfirmation.send_sms
    # bundle exec ruby customer_sms.rb
    'magic message'
  end

  private

  def lines
    puts '-' * 60
  end

  def print_menu_options
    lines
    puts '1. View SandCreams menu'
    puts '2. Select your order'
    puts '3. Review your order'
    puts '4. Complete your order'
    puts '5. Exit menu'
  end

  def welcome_note
    lines
    puts 'Welcome to Happiness Delivered! Please select from' 
    puts 'the following menu options to place your order.'
    lines
  end

  def order
    puts 'Please enter the menu item number you wish'
    puts 'to add to your basket or enter 999 to exit.'
    x = $stdin.gets.chomp.to_i
   
    while x != 999 do
      if x.between?(1, 7)
        index = (x - 1)
        @basket << @menu.sando_menu[index]
      elsif x.between?(8, 14)
        index = (x - 8)
        @basket << @menu.icecream_menu[index]
      else
        puts 'Plese select a valid menu option'
      end
      puts 'Add another dish or 999 to finish your order'
      x = $stdin.gets.chomp.to_i
    end 
  end
end

# hd = HappinessDelivered.new
# hd.interactive_menu
