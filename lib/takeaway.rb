require_relative "order"
require_relative "menu"
require_relative "checkout"

class Takeaway

attr_reader :menu, :order

  def initialize
    @menu_klass
    @menu
    @order = order
    add_menu_items
  end

  def add_menu_items
    @menu_klass = Menu.new
    @menu = @menu_klass.menu
  end

  def menu_item(number)
    @menu[number-1]
  end

  def new_customer
    "Welcome to my takeaway! Please look at the menu"
    @menu.each{ |a| puts"#{a}/n" }
    puts
    puts "Type in the menu number for your order. Type 0 to complete your order"
  end

    # loop do
    #   n = gets.chomp.to_i
    #   add_item(n, takeaway)
    #   order.each{ |a| puts"#{a}" }
    #   puts "Type in the menu number for your order. Type 0 to complete your order"
    #   break if gets.chomp == "0"
    # end
  #end


end
