## This is the user interface
require_relative 'menu'


class Takeaway

  attr_reader :shopping_basket, :bill

  def initialize
    @shopping_basket = []
    @bill = []
  end

  def view_menu
    MENU
  end


  def select_food 
    welcome_message = "Please place your order: "
    p welcome_message
    user_input = gets.to_i
    @shopping_basket << MENU[user_input]
    MENU[user_input]
  end

  def view_order
    shopping_basket
    shopping_basket.each { |x| bill << x[:price] }
    bill.reduce(:+)
  end



end
