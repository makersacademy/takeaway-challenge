## This is the user interface
require_relative 'menu'
require_relative 'message'

class Takeaway

  attr_reader :shopping_basket, :bill, :customer_order

  def initialize(message = Message.new)
    @shopping_basket = []
    @bill = []
    @message = message
    @customer_order = []
  end

  def view_menu
    MENU
  end


  def select_food 
    welcome_message = "Please place your order: "
    p welcome_message
    user_input = gets.to_i
    quantity_check = "How many would you like: "
    p quantity_check
    amount = gets.to_i
    amount.times { @shopping_basket << MENU[user_input] }
    MENU[user_input]
  end

  def view_order
    shopping_basket
    shopping_basket.each { |x| bill << x[:price] }
    bill.reduce(:+)
    shopping_basket.each {|x| x[:food]};
  end

  def show_bill
    p bill.reduce(:+)
  end

  def confirm_order
   @message.send_text
  end

end
