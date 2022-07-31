require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require 'time'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new(@menu)
    app_menu
  end

  private

  def app_menu
    puts "--------------------"
    puts "Please choose an option using 1-5"
    puts "1) View menu"
    puts "2) Add an item to your order"
    puts "3) View your order and total to pay"
    puts "4) Confirm order"
    puts "5) Exit"
    puts "--------------------"
    user_input = gets.chomp.to_i
    user_choice(user_input)
  end

  def user_choice(user_input)
    case user_input
    when 1
      @menu.show_menu
    when 2
      item_selector
    when 3
      show_current_order
    when 4
      confirm_order
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
    @menu.menu_items.key?(user_input) ? @order.add(user_input) : puts("Item not on the menu")
  end

  def show_current_order
    puts "--------------------"
    puts "Your order:"
    @order.show_order
    puts "--------------------"
    @order.show_total
  end

  def confirm_order
    show_current_order
    puts "Is the above correct? Type y to place order or n to cancel"
    user_input = gets.chomp.downcase
    user_input == "y" ? place_order : app_menu
  end

  def place_order
    msg = "Thank you! Your order was placed and will be delivered before " + delivery_time
    sms = SMS.new
    sms.send_text(msg)
    puts msg
    exit
  end

  def delivery_time
    # gets the current time and adds an hour
    (Time.now + 60 * 60).strftime("%H:%M")
  end

end
