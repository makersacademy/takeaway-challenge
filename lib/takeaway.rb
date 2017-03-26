#prints messages to user, calls methods in correct order

require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    welcome
    total_correct?
  end

  def greeting_message
    message = "Greetings, Welcome to Ruby Sushi!"
  end

  def total_correct?
    breakdown
    answer = gets.chomp.downcase
    if answer == "y"
      correct
    elsif answer == "n"
      incorrect
    else
      puts "Input invalid: please select 'y' for yes or 'n' for no"
      total_correct?
    end
  end

  private

  def correct
    sms = Sms.new
    sms.confirmation_sms
    puts "Thank you for visiting Ruby Sushi! We have sent a confirmation text for your order."
  end

  def incorrect
    puts "Press 'n' to start a new order or 'q' to quit"
    answer = gets.chomp.downcase
    until answer == "n" || answer == "q"
      puts "Input invalid: Press 'n' to start a new order or 'q' to quit"
      answer = gets.chomp.downcase
    end
    answer == "n" ? Takeaway.new : abort("Thank you for visiting Ruby Sushi!")
  end

  def welcome
    puts greeting_message
    puts menu.display
    @order = Order.new
    order.take_order
  end

  def breakdown
    puts "--------------"
    puts "Your order:"
    puts "--------------"
    order.items.each {|k,v| puts "#{v}x #{k.capitalize} @ £#{menu.dishes[k]}"}
    puts "Total: £#{order.total}"
    puts "Is this correct? (y/n)"
  end

end
