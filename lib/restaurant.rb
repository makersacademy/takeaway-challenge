require_relative 'takeaway'
require_relative 'menu'
require_relative 'text'
require 'rubygems'
require 'twilio-ruby'


class Restaurant

attr_reader :takeaway_order, :print_order, :customer

  def initialize
    @menu = Menu.new
    @takeaway_order = Takeaway.new
    @total_price = 0
    @text = Text.new
  end

  def print_menu
    @menu.pretty_print_menu
  end

  def add_item_number_to_order(num)
    @takeaway_order.add_to_current_order(num)
  end

  def print_order
    @takeaway_order.pretty_print_order
    calculates_price
    puts "Your order total comes to £#{@total_price}"
  end

  def complete_order(expected_number_of_dishes)
    fail "We do not appear to have the correct number of dishes." if expected_number_of_dishes != @takeaway_order.current_order.length
    @text.send_sms
  end

  def clears_order
    @takeaway_order.clears_current_order
  end

private

  def calculates_price
    to_be_calculated = @takeaway_order.current_order
    to_be_calculated.each do |item|
      @total_price += item[:price]
    end
  end

end
