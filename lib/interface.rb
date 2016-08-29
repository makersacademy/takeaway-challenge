require_relative 'menu'
require_relative 'order'

class Interface
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    puts "Welcome to Ewan's pizzeria!"
    puts main_menu
  end

  def main_menu
    puts ""
    puts "Please select from the following options:"
    puts "Add:"
    menu.show
    puts "Other options:"
    puts "6. Remove items"
    puts "7. Checkout"
    selection = gets.chomp
    process(selection)
  end

  def remove_menu
    puts "Please type in the item to remove or enter RETURN to go to main menu"
    order.show_basket
    item = gets.chomp
    if item.upcase == "RETURN"
      main_menu
    else
      order.remove(item)
      puts
      remove_menu
    end
  end

  def checkout
    order.show_basket
    puts 'Would you like to confirm order? (yes/no)'
    selection = gets.chomp
    if selection.downcase == "yes"
      order.confirm
    elsif selection.downcase == "no"
      main_menu
    end
  end

  def process(selection)
    case selection
      when "1"
        order.add("Margherita")
        main_menu
      when "2"
        order.add("Pepperoni")
        main_menu
      when "3"
        order.add("Vegetariana")
        main_menu
      when "4"
        order.add("Hawaiian")
        main_menu
      when "5"
        order.add("Garlic Pizza Bread")
        main_menu
      when "6"
        remove_menu
      when "7"
        checkout
      else
        puts "I'm not sure which option you wanted! - please enter a number"
        main_menu
    end
  end

  private

  attr_reader :order, :menu
end
