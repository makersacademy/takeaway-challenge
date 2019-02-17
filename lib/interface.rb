#!/usr/bin/env ruby
require 'menu'
require 'basket'

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

  def process(selection)

  end

end
