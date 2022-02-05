require_relative './order'

class Menu

  attr_accessor :menu_import, :menu, :quantity, :order

  def initialize
    @menu_import
    @menu = File.open('./menu.txt').read.split("\n")
    @quanity
    @order = []
  end

  def view_menu
    puts @menu
  end

  def select_dish
    view_menu
    puts "please select a dish number:"
    number = gets.chomp
    select_quantity
    @order = @menu[number.to_i - 1]
  end

  def select_quantity
    puts "enter a quantity"
    @quantity = gets.chomp.to_i
  end

  def place_order
    new_order = Order.new(order, quantity)
  end
end
