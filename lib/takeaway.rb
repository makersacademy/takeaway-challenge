# require 'twilio-ruby'
require_relative 'order'

class Takeaway
  attr_reader :menu
  attr_reader :display_menu
  def initialize
    @menu = {}
  end

  def add_dish_to_menu(dish, price)
    @menu[dish] = price
  end

  def display_menu
    @menu
  end

  def receive_order(*)
    p "Thank you! Your order was placed and will be delivered before #{Time.now.strftime("%I:%H")}"
  end
end
