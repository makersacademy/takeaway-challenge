require_relative 'order'
require_relative 'menu'
class Interface

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def request_input(customer_input = gets.chomp)
    display_menu
    options(customer_input)
  end

  def view_menu
    @menu.view_menu
  end

  def view_order
    @order.view_order
  end

  def add_dish(dish, quantity = 1)
    @order.add_dish(dish, quantity)
  end

  def calculate_total
    @order.calculate_total
  end

  private

  def display_menu
    puts "Welcome to Fish & Chip Shop"
    puts "---------------------------"
    puts "MENU:"
    puts "- press 1 to view our menu."
    puts "- press 2 to order a dish."
    puts "- press 3 to view your order."
    puts "- press 4 to view your order total."
    puts "- press 5 to place your order."
    puts "- press 9 to exit."
    puts "---------------------------"
    print "What would you like to do?: "
  end

  def options(customer_input)
    case customer_input
      when "1"
        view_menu
      when "2"
        print "enter the dish you wish to order:"
        dish = "cod"
        print "How many would you like:"
        quantity = 2
        add_dish(dish, quantity)
        puts "#{quantity}, #{dish} added to order!"
        "added to order!"
      when "3"
        view_order
      when "4"
        calculate_total
      when "5"

      when "9"
        exit
      else
        puts "Sorry, invalid input, try agian"
        "Sorry, invalid input, try agian"

    end
  end
end
