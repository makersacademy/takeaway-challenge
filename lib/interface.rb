require_relative 'menu'
require_relative 'order'

class Interface

  def initialize(order_class = Order)
    @menu = Menu.new
    @order = order_class

  end

  require 'ap'
  require 'twilio-ruby'

  def main_menu
    loop do
      puts "*** Welcome to the takeaway ***"
      puts "Select from the following options:"
      puts "To view the menu, press 1"
      puts "To make an order, press 2"
      puts "To exit, press 3"
      selection = gets.chomp
      case selection
      when "1"
        @menu.print_menu
      when "2"
        @order = @order.new(@menu)
        @order.select_dish
      when "3"
        puts "Thank you, goodbye!"
        exit
      else
        "Please try again"
      end
    end
  end




end
