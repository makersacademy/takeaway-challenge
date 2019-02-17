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

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def welcome
    puts "Welcome to Samurai Pizza.\n\n"
    puts "Our pizzas represent the cutting edge of quality and taste:\n\n"
    @menu.list
    print "\n\nPlease enter an order number to add item to basket, press 'r' to select an item to remove, 't' to see the contents of your basket and the total, or 'o' to place order:"

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
