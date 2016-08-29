#Understands responsibility to manage inital section of customer journey
require_relative "italian"
require_relative "basket"
require_relative "Text"

class Main

  attr_reader :menus, :print_menu, :chosen_menu

  menus = ["Italian"]

  def initialize
    @basket = Basket.new
  end

  def show_menu(type = Italian)
    type.new.menu.each.with_index(1) do |(item,price), index|
      puts "#{index}.#{item} --- £#{price}"
    end
  end

  def select_dish(dish)
    @basket.add_to_cart(dish)
  end

  def view_basket
    @basket.basket_status
  end

  def place_order
    Text.new.send
  end

end



  # attr_reader :options
  #
  # def initialize
  #   @food = Italian
  #   welcome
  #   options
  # end
  #
  # def options
  #   loop do
  #     options_list
  #     #break
  #     choice(gets.chomp)
  #   end
  # end
  #
  #
  # private
  #
  # attr_reader :welcome, :options_list
  #
  # def welcome
  #   puts "Welcome, please select a number from the list below to progress."
  # end
  #
  # def options_list
  #   puts ""
  #   puts "Choose option"
  #   puts "1. View menu"
  #   puts "2. Create new basket"
  #   puts "3. Add items to basket"
  #   puts "4. View current basket"
  # end
  #
  # def choice(select)
  #   case select
  #   when "1"
  #     print_menu
  #   when "2"
  #     basket_create
  #   when "3"
  #     @cb.add_to_cart
  #   when "4"
  #     @cb.view_basket
  #   when "9"
  #     exit
  #   else
  #     puts "I'm not sure what you mean, please choose a number."
  #   end
  # end
  #
  # def print_menu
  #   @food.new.menu.each.with_index(1) do |(item,price), index|
  #     puts "#{index}.#{item} --- £#{price}"
  #   end
  # end
  #
  # def basket_create
  #   @cb = Basket.new
  #   puts "Basket created."
  # end
