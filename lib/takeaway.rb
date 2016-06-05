## This is the user interface
require_relative 'menu'
require_relative 'message'

class Takeaway


  def initialize(message = Message.new)
    @shopping_basket = []
    @bill = []
    @message = message
  end

  def view_menu
    MENU
  end


  def select_food 
    customer_order_message
    add_to_the_basket
  end

  def view_order
    display_current_order
  end

  def show_bill
    "Your bill is: £#{ bill.reduce(:+) }"
  end

  def confirm_order
   @message.send_text
  end

  private
 
  attr_reader :shopping_basket, :bill, :customer_order, :user_input

  def display_current_order
    shopping_basket.each{ |food| bill << food[:price] }
    bill.reduce(:+)
    shopping_basket.each { |x| x[:food] }
  end
 
  def customer_order_message
    welcome_message
    @user_input = gets.to_i
    quantity_check
    amount = gets.to_i
    amount.times { @shopping_basket << MENU[user_input] }
  end
 
  def welcome_message
   p "Please place our order: "
  end

  def quantity_check
   p "How many would you like: "
  end

  def add_to_the_basket
    "You have added #{ MENU[@user_input][:food] } to the basket"
  end

end
