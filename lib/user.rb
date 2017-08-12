require_relative './menu.rb'

class User

  attr_accessor :basket, :menu

  def initialize
    @menu = Menu.new.show_menu_hash
    @basket = []
  end

  def order_instructions
    puts "Please select your order."
    puts "To do this please enter the number of your order from 1-6. Please press enter after each selection, and double enter when you have completed your order."
    puts "If you wish to order more than one of the same dish please enter this number twice, both times pressing the space bar after."
  end

  def order_selection
    order_instructions


  end

end
