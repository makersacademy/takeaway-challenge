require_relative "order"
require_relative "menu"
require_relative "checkout"



class Takeaway

  attr_reader :menu, :order, :takeaway, :checkout

  def initialize
    #@menu_klass
    @menu
    @checkout
    load_menu_items
  end

  def load_menu_items
    menu_klass = Menu.new
    @menu = menu_klass.menu
  end

  def menu_item(number)
    @menu[number-1]
  end

  def new_customer
    @order = Order.new
    puts "Welcome to my takeaway! Please look at the menu"
    puts
    display_menu
    puts
    order
  end

  def order
    loop do
      puts "Type in the menu number for your order. Type 0 to complete your order"
      number = gets.chomp.to_i
      break if number == 0
      add_item_to_order(number)
    end
    checkout
  end

  def add_item_to_order(number)
    @order.order << menu_item(number)
    @order.display
  end

  def checkout
    @checkout = Checkout.new
    @checkout.set_order(@order)
    @checkout.view_basket
    @checkout.pay
  end

  def display_menu
    @menu.each{ |a| puts"#{a}/n" }
  end

end
