require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'
require 'time'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new  
    app_menu
  end

  private

  def app_menu
    puts "Please choose an option using 1-5"
    puts "1) View menu"
    puts "2) Add an item to your order"
    puts "3) View your order and total to pay"
    puts "4) Confirm order"
    puts "5) Exit"
    user_input = gets.chomp.to_i
    user_choice(user_input)
  end

  def user_choice(user_input)
    case user_input
    when 1
      puts "--------------------"
      @menu.show_menu
      puts "--------------------"
    when 2
      item_selector
    when 3
      puts "3"
    when 4
      puts "4"
    when 5
      exit
    else
      puts "Please try again using 1-5"
    end
    app_menu
  end

  def item_selector
    puts "Enter the name of the item to add it to your basket"
    user_input = gets.chomp
    @order.add(user_input)
  end

end
