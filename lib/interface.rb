#prints messages to user, calls methods in correct order

require_relative 'menu'
require_relative 'order'

class Interface

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    welcome
    total_correct?
  end

  private

  def welcome
    puts greeting_message
    puts menu.display
    @order = Order.new
    order.take_order
  end

  def total_correct?
    breakdown
    answer = gets.chomp.downcase
    if answer == "y"
      true
    elsif answer == "n"
      false
    else
      puts "Input invalid: please select 'y' for yes or 'n' for no"
      total_correct?
    end
  end

  def breakdown
    puts "--------------"
    puts "Your order:"
    puts "--------------"
    order.items.each {|k,v| puts "#{v}x #{k} @ £#{menu.dishes[k]}"}
    puts "Total: £#{order.total}"
    puts "Is this correct? (y/n)"
  end

  def greeting_message
    message = "Greetings, Welcome to Ruby Sushi!"
  end

end
