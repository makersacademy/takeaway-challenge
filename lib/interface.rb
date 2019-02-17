#!/usr/bin/env ruby
require 'menu'
require 'basket'

class Interface

  def initialize(menu = Menu, basket = Basket)
    @menu = menu.new
    @basket = basket.new
  end

  def welcome
    puts "Welcome to Samurai Pizza.\n\n"
    puts "Our pizzas represent the cutting edge of quality and taste:\n\n"
    @menu.list
    print "\n\nPlease enter an order number to add item to basket, press 'r' to select an item to remove, 't' to see the contents of your basket and the total, 'o' to place order, or 'e' to exit:"
  end

  def process(selection)
    case selection
      when "1" then @basket.add[menu[0]]
      when "2" then @basket.add[menu[1]]
      when "3" then @basket.add[menu[2]]
      when "t" then @basket.total
      when "r"
        puts "Which item would you like to remove?"
        puts @basket.basket
        choice = gets.chomp
        @basket.remove(menu[choice - 1])
    else
      puts "Please select an option from the above menu."
    end

  end

  def looping_menu

    loop do
      welcome
      process(gets.chomp)
    end


  end


end
