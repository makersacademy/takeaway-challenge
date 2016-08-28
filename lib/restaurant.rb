#Understands a customers order
require_relative 'menu'

class Restaurant

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def print_menu
    puts
    puts " --- Welcome to Mr Shakes---".center(25)
    puts
    puts "Please choose from our menu:".center(25)
    puts
    @menu.dishes.each do |dish, price|
      puts "#{dish.ljust(10)} £#{price}".rjust(20)
    end
  end

  def add_order(item, quantity=1)
    @menu.dish_on_menu(item)
    @basket[item] = quantity
  end

  def check_order
    puts "Here's a summary of your order:".center(25)
    basket.each do |dish, quantity|
      puts "#{quantity}x #{dish.ljust(10)}"
    end
  end
end
