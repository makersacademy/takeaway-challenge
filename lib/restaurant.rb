require 'takeaway'
require 'menu'
require 'user'

class Restaurant

attr_reader :takeaway_order, :menu

  def initialize
    @takeaway_order = []
    @menu = Menu.new
  end

  def print_menu
    puts @menu.menu_list
  end


  def print_order
    puts @takeaway.order
    puts "Your order total comes to £#{price}"
  end


  def calculates_price
    # price = iterates over hash multiplying quantity by price
    # and adding together
  end


  def sends_confirmation_message
  end





end
