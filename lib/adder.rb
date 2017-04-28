# Understands adding dishes to current order
require_relative 'menu'
require_relative 'current_order'

class Adder

  attr_accessor :newmenu, :current_order

  def choice
    puts "Please enter the number of the dish you would like to add."
    @dish_number = gets.chomp.to_i
    puts "How many would you like to add?"
    order_recorder(gets.chomp.to_i)
  end

  def shower
    puts $current_order
  end

  def order_recorder(number)
    number.times { add }
  end

  def add
    $newmenu.each do |dishes|
      dishes.each { |num, info| $current_order << info if num == @dish_number }
    end
  end
end
