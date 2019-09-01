require_relative 'menu'
require_relative 'basket'

class UserSession

  attr_reader :menu, :basket
  attr_accessor :input

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Basket.new
    choice_text
  end

  def decision
    case @input
    when "1"
      @menu.menu_reader
      choice_text
    when "2"
      menu_selector
      choice_text
    when "3"
      @basket.view_basket
      choice_text
    when "4"
      payment_confirmation
    when "5"
      exit
    else
      "Not a valid selection, try again"
      choice_text
    end
  end

  private

  def choice_text
    puts "Please choose your option: number 1-5"
    puts "1. View menu"
    puts "2. Add a menu item to the basket"
    puts "3. View your order and basket total"
    puts "4. Confirm & pay for your order"
    puts "5. Quit"
    @input = gets.chomp
    decision
  end

  def payment_confirmation
    system("ruby send_sms.rb") 
  end

  def menu_selector
    puts "Enter the name of the dish to add it to basket"
    @input = gets.chomp
    if @menu.menu_hash[@input] != nil
      @basket.basket << @input.capitalize
      @basket.total << @menu.menu_hash[@input]
      puts "#{@input.capitalize} added to basket"
      choice_text
    else 
      puts "Selection not available on menu"
      choice_text
    end
  end

end