require_relative 'order'
require_relative 'menu'
class Interface

  def initialize(menu = Menu.new)
    #@customer_order = []
    @menu = menu
  end

  def request_input(customer_input = gets.chomp)
    display_menu
    options(customer_input)
  end

  def view_menu
    @menu.view_menu
  end

  private

  def display_menu
    puts "Welcome to Fish & Chip Shop"
    puts "---------------------------"
    puts "MENU:"
    puts "- press 1 to see our menu."
    puts "- press 2 order a dish."
    puts "- press 3 to see your order."
    puts "- press 4 to see your order total."
    puts "- press 5 to place an order."
    puts "- press 9 to exit."
    puts "---------------------------"
    print "What would you like to do?: "
  end

  def options(customer_input)
    case customer_input
      when "1"
        view_menu
      when "2"

      when "3"

      when "4"

      when "5"

      when "9"
        exit
      else
        puts "Sorry, invalid input, try agian"
        "Sorry, invalid input, try agian"
    end
  end
end
