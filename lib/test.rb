#!/usr/bin/env ruby

class Menu

  def initialize

    @menu = [
      { item: "1 - Kenjutsu: Chicken, Pepperoni, Green Chili", price: "10.99" },
      { item: "2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage", price: "12.49" },
      { item: "3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe", price: "15.99" }
    ]

  end

  def list
    @menu.each { |hash| puts "#{hash[:item]}. $#{hash[:price]}" }
  end

end


class Interface

  def initialize(menu = Menu, basket = Basket)
    @menu = menu.new
    @basket = basket.new
  end

  def welcome
    puts "Welcome to Samurai Pizza.\n\n"
    puts "Our pizzas represent the cutting edge of quality and taste:\n\n"
    @menu.list
    print "\n\nPlease enter an order number to add item to basket, press 'r' to select an item to remove, 't' to see the contents of your basket and the total, or 'o' to place order:"
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

end


class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(item_to_add)
    @basket << item_to_add
  end

  def remove(item_to_remove)

  end

  def total
    @total = []
    @basket.each { |hash| @total << hash[:price].to_f }
    puts "Your current order:"
    puts ""
    @basket.each { |hash| puts hash[:item] }
    print "\nAnd your current total is $#{@total.reduce(:+)}"
  end

end


interface = Interface.new
interface.welcome
