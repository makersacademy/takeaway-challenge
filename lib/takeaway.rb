# require 'twilio-ruby'
require_relative 'order.rb'

class Takeaway
  attr_reader :menu
  def initialize
    @menu = {}
  end

  def add_dish_to_menu(dish, price)
    @menu[dish] = price
  end

  def display_menu
    @menu
  end

end

