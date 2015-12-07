require 'twilio-ruby'
require 'menu.rb'
require 'send_sms.rb'

class Order

  attr_reader :options
  attr_accessor :current

  def initialize(options)
    @options = options
    @current = {}
  end

  # def options
  #   menu = Menu.new
  #   menu.options
  # end

  def total
    calculate_total
    display_order
  end

  def place_order(current, expected_total)
    calculate_total
    raise"Sorry mate- but your total is actually #{@total}" if expected_total != @total
    twil = Twillio.new
    twil.confirmation_text(display_order)
  end

  def choose(dish, quantity)
    raise "Sorry mate- #{dish} is not on the menu!" unless on_menu?(dish)
    @current[dish] = quantity
    @current
  end

  private

  def on_menu?(dish)
    @options.include?(dish)
  end

  def calculate_total
    @total = 0
    @current.each {|key, value| @total += value * @options[key] }
  end

  def display_order
    string = ''
    @current.each {|key, value| string += "#{value} #{key}s at £#{'%.2f' % @options[key]} each." + "\n" }
    string += "Your total is: £#{'%.2f' % @total}."
  end
end
