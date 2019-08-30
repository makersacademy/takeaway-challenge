require_relative 'menu'
require_relative 'basket'

class UserSession

  def initialize
    @menu = Menu.new
    @basket = Basket.new
    @total = []
  end

  def interface
    puts "Please choose your option: number 1-5"
    puts "1. View menu"
    puts "2. Add a menu item to the basket"
    puts "3. View your order and basket total"
    puts "4. Confirm & pay for your order"
    puts "5. Quit"
    input = gets.chomp
    case input
    when "1"
      @menu.menu_reader
      interface
    when "2"
      menu_selector
      interface
    when "3"
      @basket.view_basket
      interface
    when "4"
      payment_confirmation
    when "5"
      yield
    else
      "Not a valid selection, try again"
      interface
    end
  end

  def menu_selector
    puts "type in a name of the dish to add it to basket"
    input = gets.chomp
    if @menu.menu_hash[input] != nil
      @basket.basket << input.capitalize
      "#{input.capitalize} added to basket"
      interface
    else 
      "Selection not available on menu"
      interface
    end
  end

  def payment_confirmation
    system("ruby send_sms.rb") 
  end

end