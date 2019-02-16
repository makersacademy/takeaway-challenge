#!/usr/bin/env ruby
require 'menu'

class Interface

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def welcome
    puts "Welcome to Samurai Pizza."
    puts "Our pizzas represent the cutting edge of quality and taste:"
    @menu.list
  end

end
