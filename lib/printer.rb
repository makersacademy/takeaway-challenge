require 'menu'
require 'order'

class Printer
  attr_reader :menu, :order

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def print_menu
    puts @menu.display_menu
  end

  def place_order 
    puts "Please enter item name"
  end

  def input_quantity
    puts "How many would you like?"
  end 
end
