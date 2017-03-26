#prints messages to user, calls methods in correct order

require_relative 'menu'
require_relative 'order'

class Interface

  attr_reader :menu

  def initialize
    @menu = Menu.new
    welcome
  end

  def welcome
    puts greeting_message
    puts menu.display
    order = Order.new
    order.take_order
    puts order.items
  end

  private

  def greeting_message
    message = "Greetings, Welcome to Ruby Sushi!"
  end

end
