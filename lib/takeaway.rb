#prints messages to user, calls methods in correct order

require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require_relative 'words'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    welcome
    total_correct?
  end

  def total_correct?
    breakdown
    answer = gets.chomp.downcase
    if answer == "y"
      correct
    elsif answer == "n"
      incorrect
    else
      Words.invalid_input
      total_correct?
    end
  end

  private

  def correct
    sms = Sms.new
    sms.confirmation_sms
    Words.thankyou_message
  end

  def incorrect
    Words.incorrect_order_options
    answer = gets.chomp.downcase
    until answer == "n" || answer == "q"
      Words.invalid_yesno_input
      answer = gets.chomp.downcase
    end
    answer == "n" ? start_over : abort(Words.exit_message)
  end

  def start_over
    Takeaway.new
  end

  def welcome(order = Order.new)
    Words.greeting
    menu.display
    @order = order
    order.take_order
  end

  def breakdown
    Words.breakdown_header
    order.items.each {|plate,price| puts "#{price}x #{plate.capitalize} @ £#{menu.dishes[plate]}"}
    puts "Total: £#{order.total}"
    Words.breakdown_correct?
  end

end
