#!/usr/bin/env ruby
require 'menu'

class Interface

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def welcome
    puts "Welcome to Samurai Pizza.\n\n"
    puts "Our pizzas represent the cutting edge of quality and taste:\n\n"
    @menu.list
  end

end
