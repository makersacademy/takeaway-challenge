require "./lib/takeaway.rb"
require "./lib/customer.rb"
require "./lib/messenger.rb"
require "./lib/menu.rb"

class Interface
  attr_reader :menu, :takeaway, :response

  def initialize(menu = Menu.new, takeaway = Takeaway.new)
    @takeaway = takeaway
    @menu = menu
  end

  def show_options
    puts [
      '1) Whats on the menu?',
      '2) Let me order!',
      '3) Whats in my basket?',
      '4) Checkout',
      '5) Exit'
    ]
  end

  def select_option
    puts 'To select an option, please pick a number and press enter'
    @response = gets.chomp

    case @response
    when "1"
      @takeaway.list_menu
    when "2"
      puts "Enter food name or number to add to basket"
      food_selection = gets.chomp
      puts "Enter quantity"
      food_quantity = gets.chomp.to_i
      @takeaway.add_to_basket(food_selection, food_quantity)
    when "3"
      takeaway.list_basket
    when "4"
      puts "Please enter your name"
      customer_name = gets.chomp
      puts "Please enter your address"
      customer_address = gets.chomp
      takeaway.checkout
    end
  end

end
